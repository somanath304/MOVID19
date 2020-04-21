use mydb;

#Drop all tables, will give error if no tables are made;

drop table users;
drop table moderator;
drop table members;
drop table mwgroup;
drop table mwevent;
drop table vote;
drop table partof;
drop table contain;
drop table gets;
drop table movie;
drop table servers;
drop table reviews;
drop table trailers;

#Disable foreign keys
set foreign_key_checks =0;

create table if not exists users 
(userid int not null auto_increment,
firstname varchar(20),
lastname varchar(20),
email varchar(20),
passcode varchar(20),
usertype varchar (20),
moderatorid int,
memberid int,
primary key (userid),
foreign key (moderatorid) references moderator(moderatorid),
foreign key (memberid) references members(memberid)
);


create table if not exists moderator(
moderatorid int not null auto_increment,
primary key(moderatorid)
);


create table if not exists members(
memberid int not null auto_increment,
primary key (memberid)
);

create table if not exists vote(
voteid int not null auto_increment,
memberid int,
votedate date,
primary key (voteid),
foreign key (memberid) references members(memberid)
);

create table if not exists gets(
getsid int not null auto_increment,
voteid int,
movieid int,
primary key (getsid),
foreign key (voteid) references vote(voteid),
foreign key (movieid) references movie(movieid)
);

create table if not exists movie(
movieid int not null auto_increment,
moviename varchar(20),
releasedate date,
primary key (movieid)
);

create table if not exists contain(
containid int not null auto_increment,
movieid int,
mweventid int,
primary key (containid),
foreign key (movieid) references movie (movieid),
foreign key (mweventid) references mwevent(mweventid)
);

create table if not exists mwevent(
mweventid int not null auto_increment,
closevotedate date,
openvotedate date,
moviedate date,
mweventname varchar(20),
mweventstate bool,
mweventdate date,
winner varchar(20),
winningvotes int,
mwgroupid int,
primary key (mweventid),
foreign key (mwgroupid) references mwgroup(mwgroupid)
);


create table if not exists servers(
url varchar(100) not null,
servername varchar(20) not null,
primary key (servername)
);

create table if not exists partof(
partofid int not null auto_increment,
mwgroupid int,
memberid int,
primary key (partofid),
foreign key (memberid) references members (memberid),
foreign key (mwgroupid) references mwgroup(mwgroupid)
);

create table if not exists mwgroup(
mwgroupid int not null auto_increment,
mwgroupname varchar (20),
state bool,
membercount int,
createdate date,
closeddate date,
primary key (mwgroupid)
);

create table if not exists reviews(
reviewid int not null auto_increment,
movieid int,
reviewurl varchar(100),
primary key (reviewid),
foreign key (movieid) references movie(movieid)
);

create table if not exists trailers(
trailerid int not null auto_increment,
movieid int,
trailerurl varchar(100),
primary key (trailerid),
foreign key (movieid) references movie(movieid)
);

#Enable foreign keys
set foreign_key_checks =1;

#Show all tables
show tables;
truncate vote;
#Describe all tables

describe users;
describe moderator;
describe members;
describe mwgroup;
describe mwevent;
describe vote;
describe partof;
describe contain;
describe gets;
describe movie;
describe servers;
describe reviews;
describe trailers;

#See all data in all the tables

select * from users;
select * from moderator;
select * from movie;
select * from members;
select * from mwgroup;
select * from mwevent;
select * from vote;
select * from partof;
select * from contain;
select * from gets;
select * from servers;
select * from reviews;
select * from trailers;
truncate mwevent;

# Insert moderator
insert into moderator values(1); 

insert into users (userid, firstname, lastname, email, passcode, usertype, moderatorid) values (NULL, 'John','Lach','jlach@gwu.edu','pass1','Moderator',1); 

#Insert Members
insert into members values(1);
insert into members values(2);
insert into members values(3);
insert into members values(4);
insert into members values(5);
insert into members values(6);
insert into members values(7);
insert into members values(8);
insert into members values(9);
insert into members values(10);
insert into members values(11);
insert into members values(12);

insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'James','Broaddus','james@gwu.edu','pass1','Member',1); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Trevor','Noah','noahsark@gwu.edu','pass2','Member',2); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Deborah','Birx','debbybirx@gwu.edu','pass3','Member',3); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Anthony','Fauci','fauci@gwu.edu','pass4','Member',4); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Can','Korman','ckorman@gwu.edu','pass5','Member',5); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Brittany','Wright','bgw@gwu.edu','pass6','Member',6); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Kat','Hugins','katherine@gwu.edu','pass7','Member',7); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Chalvonna','Smith','chalvonna@gwu.edu','pass8','Member',8); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Preethi','Sangeetha','preethi@gwu.edu','pass9','Member',9); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Carolina','Appleseed','cappleseed@gwu.edu','pass10','Member',10); 
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Benjamin','Doolittle','Doolittle@gwu.edu','pass11','Member',11);
insert into users (userid, firstname, lastname, email, passcode, usertype, memberid) values (NULL, 'Alex','Harris','aharris@gwu.edu','pass12','Member',12);

#Get a user's info by joining users table 
#Moderator's info:
select * from users as u join moderator as m where m.moderatorid=u.moderatorid and m.moderatorid=1 and usertype="Moderator";

#Member 5's info
select * from users as u join members as me where me.memberid=u.memberid and me.memberid=2 and usertype="Member";

# Movies insertion

insert into movie (movieid, moviename, releasedate) values (245891, "John Wick", "2014-10-24");
insert into movie (movieid, moviename, releasedate) values (420818, "The Lion King", "2019-07-19");
insert into movie (movieid, moviename, releasedate) values (419704, "Ad Astra", "2019-09-20");
insert into movie (movieid, moviename, releasedate) values (338762, "Bloodshot", "2020-03-13");
insert into movie (movieid, moviename, releasedate) values (387001, "Bad Boys for Life", "2020-01-17");
insert into movie (movieid, moviename, releasedate) values (495764, "Birds of Prey", "2020-02-07");
insert into movie (movieid, moviename, releasedate) values (619264, "El hoyo", "2019-09-22");
insert into movie (movieid, moviename, releasedate) values (363088, "Ant-Man and the Wasp", "2018-07-06");
insert into movie (movieid, moviename, releasedate) values (181812, "Star Wars: Episode 8", "2019-12-20");
insert into movie (movieid, moviename, releasedate) values (351286, "Jurassic World", "2018-06-22");
insert into movie (movieid, moviename, releasedate) values (508439, "Onward", "2020-03-06");
insert into movie (movieid, moviename, releasedate) values (570670, "The Invisible Man", "2020-02-28");
insert into movie (movieid, moviename, releasedate) values (512200, "Jumanji", "2019-12-13");
insert into movie (movieid, moviename, releasedate) values (330457, "Frozen II", "2019-11-22");
insert into movie (movieid, moviename, releasedate) values (522627, "The Gentlemen", "2020-01-24");
insert into movie (movieid, moviename, releasedate) values (353081, "MI: Fallout", "2018-07-27");
insert into movie (movieid, moviename, releasedate) values (546554, "Knives Out", "2019-11-27");
insert into movie (movieid, moviename, releasedate) values (475557, "Joker", "2019-10-04");
insert into movie (movieid, moviename, releasedate) values (496243, "기생충", "2019-10-11");
insert into movie (movieid, moviename, releasedate) values (530915, "1917", "2019-12-25");
insert into movie (movieid, moviename, releasedate) values (443791, "Underwater", "2020-01-10");
insert into movie (movieid, moviename, releasedate) values (159824, "Hotel Transylvania 2", "2015-09-25");
insert into movie (movieid, moviename, releasedate) values (503919, "The Lighthouse", "2019-10-18");
insert into movie (movieid, moviename, releasedate) values (359724, "Ford v Ferrari", "2019-11-15");
insert into movie (movieid, moviename, releasedate) values (299536, "Avengers", "2018-04-27");

#Trailers Insertion

insert into trailers (trailerid, movieid, trailerurl)values (1,245891,"https://www.youtube.com/watch?v=-o5ZRrV90Hs");
insert into trailers (trailerid, movieid, trailerurl)values (2,245891,"https://www.youtube.com/watch?v=G1ahaiEni3E");
insert into trailers (trailerid, movieid, trailerurl)values (3,420818,"https://www.youtube.com/watch?v=aQN75AKDwks");
insert into trailers (trailerid, movieid, trailerurl)values (4,420818,"https://www.youtube.com/watch?v=7TavVZMewpY");
insert into trailers (trailerid, movieid, trailerurl)values (5,419704,"https://www.youtube.com/watch?v=nxi6rtBtBM0");
insert into trailers (trailerid, movieid, trailerurl)values (6,419704,"https://www.youtube.com/watch?v=t6g0dsQzfqY");
insert into trailers (trailerid, movieid, trailerurl)values (7,338762,"https://www.youtube.com/watch?v=vOUVVDWdXbo");
insert into trailers (trailerid, movieid, trailerurl)values (8,338762,"https://www.youtube.com/watch?v=0R-qIOGyEcw");
insert into trailers (trailerid, movieid, trailerurl)values (9,495764,"https://www.youtube.com/watch?v=G1ahaiEni3E");
insert into trailers (trailerid, movieid, trailerurl)values (10,495764,"https://www.youtube.com/watch?v=kGM4uYZzfu0");
insert into trailers (trailerid, movieid, trailerurl)values (11,495764,"https://www.youtube.com/watch?v=cGAQNxgV8Z0");
insert into trailers (trailerid, movieid, trailerurl)values (12,619264,"https://www.youtube.com/watch?v=Ez0rXJfjnsc");
insert into trailers (trailerid, movieid, trailerurl)values (13,619264,"https://www.youtube.com/watch?v=RlfooqeZcdY");
insert into trailers (trailerid, movieid, trailerurl)values (14,181812,"https://www.youtube.com/watch?v=HUAUvx1_WDE");
insert into trailers (trailerid, movieid, trailerurl)values (15,181812,"https://www.youtube.com/watch?v=3n1T3HxHd7Y");
insert into trailers (trailerid, movieid, trailerurl)values (16,351286,"https://www.youtube.com/watch?v=uBHTIiBmAzc");
insert into trailers (trailerid, movieid, trailerurl)values (17,351286,"https://www.youtube.com/watch?v=OH-Dy1mKaEE");
insert into trailers (trailerid, movieid, trailerurl)values (18,508439,"https://www.youtube.com/watch?v=gn5QmllRCn4");
insert into trailers (trailerid, movieid, trailerurl)values (19,508439,"https://www.youtube.com/watch?v=A5Z7QsRGxGo");
insert into trailers (trailerid, movieid, trailerurl)values (20,570670,"https://www.youtube.com/watch?v=YgXUq688vrA");
insert into trailers (trailerid, movieid, trailerurl)values (21,512200,"https://www.youtube.com/watch?v=F6QaLsw8EWY");
insert into trailers (trailerid, movieid, trailerurl)values (22,330457,"https://www.youtube.com/watch?v=bwzLiQZDw2I");
insert into trailers (trailerid, movieid, trailerurl)values (23,330457,"https://www.youtube.com/watch?v=Zi4LMpSDccc");
insert into trailers (trailerid, movieid, trailerurl)values (24,522627,"https://www.youtube.com/watch?v=KlXsguV9g0E");
insert into trailers (trailerid, movieid, trailerurl)values (25,353081,"https://www.youtube.com/watch?v=Um0aZKbpe1Y");
insert into trailers (trailerid, movieid, trailerurl)values (26,353081,"https://www.youtube.com/watch?v=XiHiW4N7-bo");
insert into trailers (trailerid, movieid, trailerurl)values (27,546554,"https://www.youtube.com/watch?v=sL-9Khv7wa4");
insert into trailers (trailerid, movieid, trailerurl)values (28,475557,"https://www.youtube.com/watch?v=xRjvmVaFHkk");
insert into trailers (trailerid, movieid, trailerurl)values (29,475557,"https://www.youtube.com/watch?v=jk41yJH3pyQ");
insert into trailers (trailerid, movieid, trailerurl)values (30,496243,"https://www.youtube.com/watch?v=PhPROyE0OaM");
insert into trailers (trailerid, movieid, trailerurl)values (31,496243,"https://www.youtube.com/watch?v=isOGD_7hNIY");
insert into trailers (trailerid, movieid, trailerurl)values (32,159824,"https://www.youtube.com/watch?v=IUUMODHe7r8");
insert into trailers (trailerid, movieid, trailerurl)values (33,159824,"https://www.youtube.com/watch?v=T3nqmGgnJe8");
insert into trailers (trailerid, movieid, trailerurl)values (34,503919,"https://www.youtube.com/watch?v=42_UHhpq530");
insert into trailers (trailerid, movieid, trailerurl)values (35,503919,"https://www.youtube.com/watch?v=BRuxEntZ1Mk");
insert into trailers (trailerid, movieid, trailerurl)values (36,359724,"https://www.youtube.com/watch?v=I3h9Z89U9ZA");
insert into trailers (trailerid, movieid, trailerurl)values (37,359724,"https://www.youtube.com/watch?v=_uwkU6uNH1c");
insert into trailers (trailerid, movieid, trailerurl)values (38,299536,"https://www.youtube.com/watch?v=3VbHg5fqBYw");
insert into trailers (trailerid, movieid, trailerurl)values (39,299536,"https://www.youtube.com/watch?v=6ZfuNTqbHE8");
insert into trailers (trailerid, movieid, trailerurl)values (40,299536,"https://www.youtube.com/watch?v=pVxOVlm_lE8");

#Reviews Insertion
insert into reviews (reviewid, movieid, reviewurl)values (1,245891,"https://www.themoviedb.org/review/55c8b6c4c3a3686a820008c9");
insert into reviews (reviewid, movieid, reviewurl)values (2,245891,"https://www.themoviedb.org/review/570421099251415bbb000866");
insert into reviews (reviewid, movieid, reviewurl)values (3,420818,"https://www.themoviedb.org/review/5d31d3991d78f2000ee0b492");
insert into reviews (reviewid, movieid, reviewurl)values (4,420818,"https://www.themoviedb.org/review/5e073ed64c1d9a0015e16e4c");
insert into reviews (reviewid, movieid, reviewurl)values (5,419704,"https://www.themoviedb.org/review/5d8382069e458602269604e4");
insert into reviews (reviewid, movieid, reviewurl)values (6,419704,"https://www.themoviedb.org/review/5d9e02057f05400037ab4d04");
insert into reviews (reviewid, movieid, reviewurl)values (7,495764,"https://www.themoviedb.org/review/5e483ee5676ce20015fddb51");
insert into reviews (reviewid, movieid, reviewurl)values (8,619264,"https://www.themoviedb.org/review/5e7dbc02fea0d772afc9c9b5");
insert into reviews (reviewid, movieid, reviewurl)values (9,619264,"https://www.themoviedb.org/review/5e80cd7c4e67420014d96b26");
insert into reviews (reviewid, movieid, reviewurl)values (10,363088,"https://www.themoviedb.org/review/5bc243310e0a266e6b035e11");
insert into reviews (reviewid, movieid, reviewurl)values (11,363088,"https://www.themoviedb.org/review/5bfa580592514104cc022459");
insert into reviews (reviewid, movieid, reviewurl)values (12,181812,"https://www.themoviedb.org/review/5dfc767326dac100175d49c7");
insert into reviews (reviewid, movieid, reviewurl)values (13,181812,"https://www.themoviedb.org/review/5dfcb04f65686e001390cd34");
insert into reviews (reviewid, movieid, reviewurl)values (14,351286,"https://www.themoviedb.org/review/5b9f08d3925141231900fa88");
insert into reviews (reviewid, movieid, reviewurl)values (15,351286,"https://www.themoviedb.org/review/5bdc66dac3a368403200f453");
insert into reviews (reviewid, movieid, reviewurl)values (16,508439,"https://www.themoviedb.org/review/5dfcb04f65686e001390cd34");
insert into reviews (reviewid, movieid, reviewurl)values (17,508439,"https://www.themoviedb.org/review/5e5f4a42357c0000132f80e0");
insert into reviews (reviewid, movieid, reviewurl)values (18,351286,"https://www.themoviedb.org/review/5e6aedae55c926001966fdd6");
insert into reviews (reviewid, movieid, reviewurl)values (19,351286,"https://www.themoviedb.org/review/5bdc66dac3a368403200f453");
insert into reviews (reviewid, movieid, reviewurl)values (20,508439,"https://www.themoviedb.org/review/5bdc66dac3a368403200f453");
insert into reviews (reviewid, movieid, reviewurl)values (21,508439,"https://www.themoviedb.org/review/5e5f4a42357c0000132f80e0");
insert into reviews (reviewid, movieid, reviewurl)values (22,570670,"https://www.themoviedb.org/review/5e5e6a7787e63e001a75dc1b");
insert into reviews (reviewid, movieid, reviewurl)values (23,570670,"https://www.themoviedb.org/review/5e6c52b6a9b9a400149f732d");
insert into reviews (reviewid, movieid, reviewurl)values (24,512200,"https://www.themoviedb.org/review/5e2236748f26bc001374b209");
insert into reviews (reviewid, movieid, reviewurl)values (25,512200,"https://www.themoviedb.org/review/5e621d3522af3e001add28e8");
insert into reviews (reviewid, movieid, reviewurl)values (26,330457,"https://www.themoviedb.org/review/5ddb52473faba00013ff93b2");
insert into reviews (reviewid, movieid, reviewurl)values (27,330457,"https://www.themoviedb.org/review/5ddcebbea80673001212bb00");
insert into reviews (reviewid, movieid, reviewurl)values (28,522627,"https://www.themoviedb.org/review/5e1d348b95c0af00131150b6");
insert into reviews (reviewid, movieid, reviewurl)values (29,522627,"https://www.themoviedb.org/review/5e57e78235811d001960e7bd");
insert into reviews (reviewid, movieid, reviewurl)values (30,299536,"https://www.themoviedb.org/review/5e24d052a894d600153a8bd4");
insert into reviews (reviewid, movieid, reviewurl)values (31,299536,"https://www.themoviedb.org/review/5e259f0e21c4ca0015f897f3");

#Show trailers of the movie "Starwars" with movieid=181812
select m.moviename, t.trailerurl from movie as m, trailers as t where m.movieid = t.movieid and m.movieid= 181812;

#Show reviews of the movie "The Gentlemen" with movieid=522627
select m.moviename, r.reviewurl from movie as m, reviews as r where m.movieid = r.movieid and m.moviename="The Gentlemen";

#Search movies
select * from movie where moviename like "%Star%";


#Insert Groups
insert into mwgroup (mwgroupid, mwgroupname, state, membercount, createdate) values (1, "Group1", true, NULL, "2019-05-02");
insert into mwgroup (mwgroupid, mwgroupname, state, membercount, createdate) values (2, "Group2", true, NULL, "2019-09-11");

#Date Casting
select date("2019-09-11");
#Difference between dates (Closedate, Votingdate), When voting date=closedvotdate, the members cannot vote (difference is 0)
#Defilnitely not for -ve values.
select datediff(date("2019-09-20"),date("2019-09-20")) as counts into @votedate;
select @votedate;

# Inserting members into groups
insert into partof (partofid, mwgroupid, memberid) values (1, 1, 1);
insert into partof (partofid, mwgroupid, memberid) values (2, 1, 2);
insert into partof (partofid, mwgroupid, memberid) values (3, 1, 3);
insert into partof (partofid, mwgroupid, memberid) values (4, 1, 4);
insert into partof (partofid, mwgroupid, memberid) values (5, 1, 5);
insert into partof (partofid, mwgroupid, memberid) values (6, 1, 6);

insert into partof (partofid, mwgroupid, memberid) values (7, 2, 7);
insert into partof (partofid, mwgroupid, memberid) values (8, 2, 8);
insert into partof (partofid, mwgroupid, memberid) values (9, 2, 9);
insert into partof (partofid, mwgroupid, memberid) values (10, 2, 10);
insert into partof (partofid, mwgroupid, memberid) values (11, 2, 11);
insert into partof (partofid, mwgroupid, memberid) values (12, 2, 12);

select * from partof;
#Show groups of member named Chalvonna smith with memberid=8
select u.firstname, u.lastname, g.mwgroupname from users as u, members as m, mwgroup as g, partof as p where m.memberid=u.memberid
and m.memberid=p.memberid and p.mwgroupid=g.mwgroupid; 

# Not to be used Crap:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
show databases;

insert into vote (voteid, memberid, votedate) values (NULL, 1, "2019-05-20");
insert into vote (voteid, memberid, votedate) values (NULL, 2, "2019-05-20");
insert into vote (voteid, memberid, votedate) values (NULL, 3, "2019-05-20");
insert into vote (voteid, memberid, votedate) values (NULL, 4, "2019-05-20");
insert into vote (voteid, memberid, votedate) values (NULL, 5, "2019-05-21");
insert into vote (voteid, memberid, votedate) values (NULL, 6, "2019-05-21");

insert into vote (voteid, memberid, votedate) values (NULL, 7, "2019-06-11");
insert into vote (voteid, memberid, votedate) values (NULL, 8, "2019-06-11");
insert into vote (voteid, memberid, votedate) values (NULL, 9, "2019-06-11");
insert into vote (voteid, memberid, votedate) values (NULL, 10, "2019-06-11");
insert into vote (voteid, memberid, votedate) values (NULL, 11, "2019-06-11");
insert into vote (voteid, memberid, votedate) values (NULL, 12, "2019-06-11");
truncate vote;
select * from vote;
alter table mwevent modify mweventstate bool;

#Inserting events into groups.
insert into mwevent (mweventid, closevotedate, openvotedate, moviedate, mweventname, mweventstate, mweventdate, winner, winningvotes, mwgroupid)
values (NULL, "2019-05-22", "2019-05-20", "2019-05-23", "Group 1: Movie Event", true, "2019-05-20", NULL, NULL, 1);

describe mwevent;
select * from mwevent;

insert into mwevent (mweventid, closevotedate, openvotedate, moviedate, mweventname, mweventstate, mweventdate, winner, winningvotes, mwgroupid)
values (NULL, "2019-06-13", "2019-06-10", "2019-06-15", "Group 2: Movie Event", true, "2019-06-10", NULL, NULL, 2);

#setting up a variable (skip);
select @totalmovies;
set @totalmovies=0;
select count(distinct movieid) as count into @totalmovies from movie;
select count(distinct movieid) from movie group by movieid;

#insert values in contains, matching movie and events;
insert into contain (containid, movieid, mweventid) values (NULL, 245891, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 420818, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 419704, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 338762, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 387001, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 495764, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 619264, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 363088, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 181812, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 351286, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 508439, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 570670, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 512200, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 330457, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 522627, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 546554, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 475557, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 496243, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 530915, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 443791, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 159824, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 503919, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 359724, 1);
insert into contain (containid, movieid, mweventid) values (NULL, 299536, 1);

insert into contain (containid, movieid, mweventid) values (NULL, 245891, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 420818, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 419704, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 338762, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 387001, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 495764, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 619264, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 363088, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 181812, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 351286, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 508439, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 570670, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 512200, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 330457, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 522627, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 546554, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 475557, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 496243, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 530915, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 443791, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 159824, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 503919, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 359724, 2);
insert into contain (containid, movieid, mweventid) values (NULL, 299536, 2);

truncate gets;
#Movies are being assigned votes
insert into gets (getsid, voteid, movieid) values (NULL, 1, 181812);
insert into gets (getsid, voteid, movieid) values (NULL, 2, 475557);
insert into gets (getsid, voteid, movieid) values (NULL, 3, 181812);
insert into gets (getsid, voteid, movieid) values (NULL, 4, 443791);
insert into gets (getsid, voteid, movieid) values (NULL, 5, 619264);
insert into gets (getsid, voteid, movieid) values (NULL, 6, 338762);

insert into gets (getsid, voteid, movieid) values (NULL, 7, 512200);
insert into gets (getsid, voteid, movieid) values (NULL, 8, 299536);
insert into gets (getsid, voteid, movieid) values (NULL, 9, 159824);
insert into gets (getsid, voteid, movieid) values (NULL, 10, 546554);
insert into gets (getsid, voteid, movieid) values (NULL, 11, 546554);
insert into gets (getsid, voteid, movieid) values (NULL, 12, 387001);

#Show events of both the groups
select g.mwgroupid, g.mwgroupname,e.mweventid, e.mweventname from mwevent as e join mwgroup as g where e.mwgroupid=g.mwgroupid;

#Show all movie names in an event for all groups
select g.mwgroupname, e.mweventname, m.moviename 
from mwevent as e join mwgroup as g join movie as m join contain as c 
where e.mwgroupid=g.mwgroupid 
and e.mweventid=c.mweventid
and c.movieid=m.movieid;

#Show all movie names voted by members (specifying their names) Melo
select u.firstname, u.lastname, mov.moviename 
from users as u join members as m join vote as v join gets as g join movie as mov 
where m.memberid=u.memberid
and m.memberid=v.memberid 
and v.voteid=g.voteid 
and g.movieid=mov.movieid;

#Show all votes that a movie got in an event

select m.moviename, count(distinct v.voteid) from 
mwevent as e join contain as c join movie as m join gets as g join vote as v
where e.mweventid=c.mweventid
and c.movieid=m.movieid
and m.movieid=g.movieid
and g.voteid=v.voteid 
group by m.moviename;


#Group 1 members voted for which movies
select u.firstname, u.lastname, mov.moviename
from users as u, members as m, vote as v, gets as g, movie as mov, contain as c, mwevent as e, partof as p
where p.memberid=m.memberid
and p.mwgroupid=2
and m.memberid=u.memberid
and m.memberid=v.memberid 
and v.voteid=g.voteid 
and g.movieid=mov.movieid
and mov.movieid=c.movieid
and c.mweventid=e.mweventid
and e.mweventid=2;

#Group 1 Movies got how many votes
select mov.moviename, count(distinct v.voteid)
from users as u, members as m, vote as v, gets as g, movie as mov, contain as c, mwevent as e, partof as p
where p.memberid=m.memberid
and p.mwgroupid=2
and m.memberid=u.memberid
and m.memberid=v.memberid 
and v.voteid=g.voteid 
and g.movieid=mov.movieid
and mov.movieid=c.movieid
and c.mweventid=e.mweventid
and e.mweventid=2
group by mov.moviename;

#Winning Votes for group 1 winner
select max(votecount) from
(select count(distinct v.voteid) as votecount
from users as u, members as m, vote as v, gets as g, movie as mov, contain as c, mwevent as e, partof as p
where p.memberid=m.memberid
and p.mwgroupid=1
and m.memberid=u.memberid
and m.memberid=v.memberid 
and v.voteid=g.voteid 
and g.movieid=mov.movieid
and mov.movieid=c.movieid
and c.mweventid=e.mweventid
and e.mweventid=1
group by mov.moviename) as table1;


set @winningvotes=0;

#Winning Votes for group 1 winner and storing that into a variable
select max(votecount) as count into @winningvotes from
(select count(distinct v.voteid) as votecount, mov.moviename as winner
from users as u, members as m, vote as v, gets as g, movie as mov, contain as c, mwevent as e, partof as p
where p.memberid=m.memberid
and p.mwgroupid=1
and m.memberid=u.memberid
and m.memberid=v.memberid 
and v.voteid=g.voteid 
and g.movieid=mov.movieid
and mov.movieid=c.movieid
and c.mweventid=e.mweventid
and e.mweventid=1
group by mov.moviename) as table2;

select @winningvotes;

select e.mweventid from members as m, partof as p, mwgroup as g, mwevent as e where m.memberid=p.memberid and p.mwgroupid=g.mwgroupid and g.mwgroupid=e.mwgroupid and m.memberid=2;



describe users;
describe moderator;
describe members;
describe mwgroup;
describe mwevent;
describe vote;
describe partof;
describe contain;
describe gets;
describe movie;
describe servers;
describe reviews;
describe trailers;