import json
import requests
import re
import pymysql # Import mysql client for python

# Global Variables
_apiKey = '92238e37f1e537110957739ab8ce48af'
_rootURL = "https://api.themoviedb.org/3/"
_language = "en-US"
_region = "US"
_dbServerName = "localhost" # Server Name
_dbUser       = "root"      # Username
_dbPassword   = "password"     # Password
_dbPort       = 3306        # Port
_dbCharSet    = "utf8mb4"   # Character Encoding Type
_cntMovie 	  = 0
_cntTrailer   = 0 
_cntReview    = 0

def getPages():
	""" Returns the number of pages to pull from server """
	pages = input("Enter the number of pages or 'q' to quit: ")
	while(pages != 'q'):
		if(int(pages) <= 0):
			print("Illegal pages: Must be a non-negative page")
		else:
			return int(pages)
		pages = input("Enter the number of pages or 'q' to quit: ")
def pullPopularMovies(page = 1):
	""" Call the movie server with the _apiKey, extract the relevant information and associated them with the movie id """
	response = requests.get(_rootURL+"movie/popular?api_key="+_apiKey+"&language="+_language+"&page="+str(page)+"&region="+_region)
	results_len = len(response.json()['results'])
	popular_movies = {}
	for i in range(results_len):
		movie_id = (response.json()['results'][i]['id'])
		movie_name = (response.json()['results'][i]['original_title'])
		movie_description = (response.json()['results'][i]['overview'])
		movie_release = (response.json()['results'][i]['release_date'])
		review_response = requests.get(_rootURL+"movie/"+str(movie_id)+"/reviews?api_key="+_apiKey+"&language="+_language+"&page="+str(page))
		review_len = len(review_response.json()['results'])
		movie_review = []
		for j in range(1, review_len):
			if j == 2:
				break
			movie_review.append(review_response.json()['results'][j]['url'])
		trailer_response = requests.get(_rootURL+"movie/"+str(movie_id)+"/videos?api_key="+_apiKey+"&language="+_language)
		trailer_len = len(trailer_response.json()['results'])
		movie_trailer = []
		for j in range(1, trailer_len):
			if j == 2: 
				break
			link = "https://www.youtube.com/watch?v=" + str(trailer_response.json()['results'][j]['key'])
			movie_trailer.append(link)
		popular_movies[movie_id] = {'name': movie_name, 'description': movie_description, 'release_date': movie_release, 'trailer_link': movie_trailer, 'review_link': movie_review}
	return popular_movies
def pullMovies():
	""" Pull the movies from the server """
	pages = getPages()
	popular_movies = {}
	for i in range(1, pages+1):
		if popular_movies:
			popular_movies.update(pullPopularMovies(i))
		else:
			popular_movies = pullPopularMovies(1)
	# for i in popular_movies.items(): print(i)
	# with open('pulledMovies.json', 'w') as json_file:
	# 	""" Output dictionary "popular_movies" as json file """
	# 	json.dump(popular_movies, json_file)
	return popular_movies

def establishConnection():
	""" Create connection object """
	connectionObject = pymysql.connect(host=_dbServerName, port=_dbPort, user=_dbUser, passwd=_dbPassword, charset=_dbCharSet, autocommit = True)
	cursorObject = connectionObject.cursor() # Create cursor object
	cursorObject._defer_warnings = True # Defers the warnings
	return connectionObject, cursorObject
def terminateConnection(connectionObject, cursorObject):
	""" Terminate connection object """
	cursorObject.close()
	connectionObject.close()
	# print("MySQL connection is closed.")
def createSchema(cursorObject, schemaName):
	""" Create the schema/database """
	cursorObject.execute(f"CREATE SCHEMA IF NOT EXISTS {schemaName};")
	cursorObject.execute(f"USE {schemaName};")
def deleteSchema(cursorObject, schemaName):
	""" Delete the schema/database """
	cursorObject.execute(f"DROP DATABASE {schemaName};")
	# print(f"Dropped Schema {schemaName}")
def setForeignKey(cursorObject, value):
	""" Set foreign key to 0/1 to allow easy modification of Tables """
	if isinstance(value, int) and (value == 0 or value == 1):
		cursorObject.execute(f"set foreign_key_checks = {value};")
		# return print(f"Set foreign key to {value}")
def createTables(cursorObject):
	""" Create all necessary tables in the database """
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS users(userid int NOT NULL AUTO_INCREMENT, firstname varchar(20), lastname varchar(20), email varchar(20), passcode varchar(20), usertype varchar (20), moderatorid int, memberid int, PRIMARY KEY (userid), FOREIGN KEY (moderatorid) REFERENCES moderator(moderatorid), FOREIGN KEY (memberid) REFERENCES members(memberid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS moderator(moderatorid int NOT NULL AUTO_INCREMENT, PRIMARY KEY (moderatorid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS members(memberid int NOT NULL AUTO_INCREMENT, PRIMARY KEY (memberid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS vote(voteid int NOT NULL AUTO_INCREMENT, memberid int, votedate date, PRIMARY KEY (voteid), FOREIGN KEY (memberid) REFERENCES members(memberid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS gets(getsid int NOT NULL AUTO_INCREMENT, voteid int, movieid int, PRIMARY KEY (getsid), FOREIGN KEY (voteid) REFERENCES vote(voteid), FOREIGN KEY (movieid) REFERENCES movie(movieid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS movie(movieid int NOT NULL AUTO_INCREMENT, moviename varchar(20), releasedate date, PRIMARY KEY (movieid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS contain(containid int NOT NULL AUTO_INCREMENT, movieid int, mweventid int, PRIMARY KEY (containid), FOREIGN KEY (movieid) REFERENCES movie (movieid), FOREIGN KEY (mweventid) REFERENCES mwevent(mweventid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS mvevent(mweventid int NOT NULL AUTO_INCREMENT, closevotedate date, openvotedate date, moviedate date, mweventname varchar(20), mweventstate bool, mweventdate date, winner varchar(20), winningvotes int, mwgroupid int, PRIMARY KEY (mweventid), FOREIGN KEY (mwgroupid) REFERENCES mwgroup (mwgroupid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS servers(url varchar(100) not null, servername varchar(20) not null, PRIMARY KEY (servername));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS partof(partofid int NOT NULL AUTO_INCREMENT, mwgroupid int, memberid int, PRIMARY KEY (partofid), FOREIGN KEY (memberid) REFERENCES members (memberid), FOREIGN KEY (mwgroupid) REFERENCES mwgroup(mwgroupid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS mwgroup(mwgroupid int NOT NULL AUTO_INCREMENT, mwgroupname varchar (20), state bool, membercount int, createdate date, closeddate date, PRIMARY KEY (mwgroupid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS reviews(reviewid int NOT NULL AUTO_INCREMENT, movieid int, reviewurl varchar(100), PRIMARY KEY (reviewid), FOREIGN KEY (movieid) REFERENCES movie(movieid));")
	cursorObject.execute(f"CREATE TABLE IF NOT EXISTS trailers(trailerid int NOT NULL AUTO_INCREMENT, movieid int, trailerurl varchar(100), PRIMARY KEY (trailerid), FOREIGN KEY (movieid) REFERENCES movie(movieid));")
def setEnvironment(schemaName):
	connectionObject, cursorObject = establishConnection()
	createSchema(cursorObject, schemaName)
	setForeignKey(cursorObject, 0) # Disable foreign key dependencies warning
	createTables(cursorObject)
	# print(f"Created Schema {schemaName} and Tables")
	return connectionObject, cursorObject

def insertMovie(cursorObject, movieName, releaseDate):
	global _cntMovie
	cursorObject.execute(f"INSERT IGNORE INTO OOP.movie (movieid, moviename, releasedate) VALUES (NULL, '{movieName}', '{releaseDate}');")
	_cntMovie += 1
	# print(f"Inserted Movie {_cntMovie}: {movieName}")
def insertTrailer(cursorObject, movieID, trailerURL):
	global _cntTrailer
	cursorObject.execute(f"INSERT IGNORE INTO OOP.trailers (trailerid, movieid, trailerurl) VALUES (NULL, '{movieID}', '{trailerURL}');")
	_cntTrailer += 1
	# print(f"Inserted Trailer {_cntMovie}: {trailerURL} for movie_id: {movieID}")
def insertReview(cursorObject, movieID, reviewURL):
	global _cntReview
	cursorObject.execute(f"INSERT IGNORE INTO OOP.reviews (reviewid, movieid, reviewurl) VALUES (NULL, '{movieID}', '{reviewURL}');")
	_cntReview += 1

def main():
	popularMovies = pullMovies()
	connectionObject, cursorObject = setEnvironment(schemaName = "OOP")
	movie_len = len(popularMovies)
	for movie in popularMovies.items():
		movie_name = movie[1]['name']
		movie_name = movie_name.replace("\"","")
		movie_name = movie_name.replace("\'","")
		movie_release = movie[1]['release_date']
		movie_trailer = movie[1]['trailer_link']
		movie_review = movie[1]['review_link']
		insertMovie(cursorObject, movie_name, movie_release)
		trailer_len = len(movie[1]['trailer_link'])
		if trailer_len > 0:
			for i in range(trailer_len):
				insertTrailer(cursorObject, _cntMovie, movie_trailer[i])
		review_len = len(movie[1]['review_link'])
		if review_len > 0:
			for i in range(review_len):
				insertReview(cursorObject, _cntMovie, movie_review[i])
	setForeignKey(cursorObject, value = 1)
	# deleteSchema(cursorObject, schemaName = "OOP")
	terminateConnection(connectionObject, cursorObject)

if __name__ == "__main__": main()