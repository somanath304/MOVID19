# MOVID19
About
This is a multipurpose system that was designed by Group 13 as a part of the final assessment for Object 
Oriented Design course for Spring 2020. The system is called “MOVID-19”. The inspiration behind the name 
comes from the consequence of the real life social distancing orders by governments all around the world. 
This has left people without a lot of ways to get together with friends and family and enjoy with each other.
Since a lot of people cannot go out of their homes and gather to do socially fun activities like watching
movies in theaters, this system serves as the bridge between people deciding on a movie, voting for their 
choices and watching the winning movie together with each other online.

The system revolves around the voting system that allows members to popularly select the movies that everyone
will watch as a group online, mimicking a real life meeting at a theater and watching a movie together.

People will become a part of a group that will consist of their friends and family members and will vote on which
movie to watch on the website, rather than meeting together in real life and then deciding which movie to watch. 
This system will bring movies that are currently popular and in demand and people will be able to vote for the 
movies that they want to watch with everyone. Members of a group will also be able to watch the trailers and read 
reviews of all the movies that are available for their group, which will help them make their choice. Members will 
also be able to modify their vote after initially voting if they choose to. After a movie wins the voting round, 
that movie can be watched at any of the other popular movie platforms like Netflix, Prime Videos, Apple TV and more.

Everything is controlled by a moderator which has the power to virtually do anything that they feel is necessary 
to keep the website working seamlessly. This includes the ability to invite people, add them as members in a group. 
Creating voting events which will end with a winning movie that the members of that group will watch. Moderator
will also be able to populate the movies from the system.

Members will have the ability to see all the movies that are available currently and vote for them as soon as a 
movie watching event is created for their group. They will also be able to manage their profile and do basic functions 
like watch movie trailers and read movie reviews for the movies that they are interested in.

Moderator Collapsible Info: 

Invite user: Invite() 

Description: 

This section is designed for enabling the moderator to invite new people to the website to signup on the website’s signup page.

Procedure: 
Moderator will enter an email of the user that they want to invite to join the website.
Moderator will click the “Invite” button to submit the email.
The website will send a pre-formatted email to the email that was provided by the moderator.
Email recipients will click on the website link to land on the signup page.
The user will add their information like “First Name”, “Last Name”, “Email” and a “Password” and their information will be registered in the DB.
The user can then go on the Login page to input their information and login.

Outcome: 
The user is invited to the website and after putting their information, they should be able to login.

Create Group: Create Group() 

Description: 

This section is designed for enabling the moderator to create a new movie watching group which can be filled with members at a later point of time.

Procedure: 
Moderator will enter an appropriate name (generally non repetitive) as an input.
The creation date column will show a drop down calendar in which the default date will be shown as the current date. But it is customizable for any date.
Upon clicking the “Create Group” button, all the information will be submitted into the database and a group will be created.

Outcome: 
A group will be created with very minimal information and we will be able to add members into that group.





Show Groups and Add User: Add User() 

Description: 

This section is designed for enabling the moderator to add a member into the already existing or a newly created group.

Procedure: 
Moderator will be able to see the group information. Information such as “Group ID”, “Group Name”, “Group State”, “Creation date” of that group will be displayed in the table form.
Moderator will be able to see the user’s information. A user is not yet a member of any group but is a user of the website. Information such as “First Name”, “Last Name” “Email ID” and “ID” of that user will be displayed in the table form.
Moderator will be able to choose a specific GroupID and a specific MemberID for adding that as a member.
Moderator will input a member id that they want to insert as a member into a selected group.
Moderator will also input a Group ID into the text box in which the corresponding user will be inserted as a member.

Outcome: 
The selected website user will be inserted as a member of the selected group.


Create Event: Create Event()

Description: 

This section is designed for enabling the moderator to create a new movie watching event for an already existing group. All the date fields will give us a drop down calendar which will allow the moderator to choose the dates.

Procedure: 
Moderator will fill in the information in the given fields. First, they will give a name to the event that they will be assigned to the group.
Next, they will fill in the date when the voting is supposed to begin. This date generally can be selected as the date of the creation of the event. A member cannot vote before the voting period has been opened.
They will then fill in the date when the voting is supposed to close. Usually a close vote date will be decided ideally a few days after the open vote date. A user cannot vote after the close vote date has passed.
Inserting movie date will define when the movie will be screened or shown for the patrons of that group.
Movie event date is the date when this event was created. Generally, the voting open date is the same as the open voting period date that we previously mentioned.
Finally we will enter the group id of the group that we are making this event for. We can select the group id out of all the other group ids that are available.
A new page will open which will show the group ids, group names and the corresponding event ids and event names.
You can select which event to look up the information from, which will show all the event details.

Outcome: 
A new movie watching event will be created with specific dates, open and closed voting dates.

Populate Movies: Populate Movies()

Description: 

This section is designed for enabling the moderator to pull a list of movie information. This will contain attributes like a predefined movie id, movie name, movie’s trailer url links and movie review links.

Procedure: 
Moderator has to simply press the button of “populate movies” and the control will go back to a python script that will auto populate a list of movies into the database.
The function will also pull the corresponding movie’s trailer links and review links for the moderator and upload that adjacently with the respected movies.
The movie list that has been populated will be shown on the next pages after clicking ‘populate movies’.
The same movie list will also be populated into the vote function for the user of the system so that they can see movie trailers, read movie reviews before voting for a movie or modifying vote for the same movie into another movie. 

Outcome: 
A new movie list, trailer url list and review url list will be populated into the database and will be displayed on the next webpage.

Winner Display: Display Winner()

Description: 

This section is designed for enabling the moderator to display the winning movie with the winning votes for a particular movie watching of a particular movie watching group.

Procedure: 
Moderator will show all the information by pressing the “Winner Display” button.
The next page will show the First Name and the Last name of the user and the movies that those users have voted for. 
Beneath the movie voting details table, we will see all the movies that have received a vote from the voters (members) of that group and the event. It will also show the count of all the votes that a movie received.
At the end of the page, we will see the winning movie that has won the voting provided by all the members that voted in that group.

Outcome: 
Upon voting, a movie wins the voting and is displayed by the website. That movie will be eventually screened for the group patrons.

Member Collapsible Info:

Vote Event: Vote Event()

Description: 

This section is designed for letting a user vote for the movie of their choice for a particular event in a particular group.

Procedure: 
Users will click on the “Vote Event” button and will redirect to another page.
On the next page, they will be able to see all the movies that are available for that particular group and event. They can select a movie id of the movie that they wanna vote for.
They can also see the trailers and read reviews of the movies that they wanna probably vote for. 
After they have selected a movie that they wanna vote for, they will have the option of putting that movie id into a text box that will accept that movie id as their voted movie.
To authenticate their vote for that particular voting event, users will have to enter their password. The password will translate into the member’s id that we will grab and cast a vote for a movie that is in that event and register in our database.

Outcome: 
A vote will be cast for the movie that a user chooses and wants to be screened during show time. 





Modify Event: Modify Event()

Description: 

This section is designed for letting a user re-vote or modify their vote for the movie of their choice for a particular event in a particular group.

Procedure: 
Users will click on the “Modify Vote” button and will redirect to another page.
On the next page, they will be able to see all the movies that are available for that particular group and event. They can select a movie id of the movie that they wanna change their vote towards.
They can also see the trailers and read reviews of the movies that they wanna vote for. 
After they have selected a movie that they wanna modify their vote for, they will have the option of putting that movie id into a text box that will accept that movie id as their voted movie.
To authenticate their re-vote for that particular voting event, users will have to enter their password. The password will translate into the member’s id that we will grab and cast a vote for the updated movie choice of that user in that event and register in our database in place of the previous movie choice.

Outcome: 
A vote will be modified for the movie that a user chooses and wants to be screened during show time. 

Unsubscribe from group: Unsubscribe()

Description: 

This section is designed for letting a user voluntarily unsubscribe from a group, should they choose to.

Procedure: 
Users will click on the “Unsubscribe” button and will redirect to another page.
On the next page, they will be able to input the group id of the group that they wanna unsubscribe from.
To authenticate their action for that particular group, users will have to enter their password. The password will translate into the member’s id that we will grab and will ultimately detach any connection that they might have with their group.

Outcome: 
The user that is currently logged in will be removed from the group that they chose to unsubscribe from.


About:

This is a multipurpose system that was designed by Group 13 as a part of the final assessment for Object Oriented Design course for Spring 2020. The system is called “MOVID-19”. The inspiration behind the name comes from the consequence of the real life social distancing orders by governments all around the world. This has left people without a lot of ways to get together with friends and family and enjoy with each other. Since a lot of people cannot go out of their homes and gather to do socially fun activities like watching movies in theaters, this system serves as the bridge between people deciding on a movie, voting for their choices and watching the winning movie together with each other online. 

The system revolves around the voting system that allows members to popularly select the movies that everyone will watch as a group online, mimicking a real life meeting at a theater and watching a movie together.

People will become a part of a group that will consist of their friends and family members and will vote on which movie to watch on the website, rather than meeting together in real life and then deciding which movie to watch. This system will bring movies that are currently popular and in demand and people will be able to vote for the movies that they want to watch with everyone. Members of a group will also be able to watch the trailers and read reviews of all the movies that are available for their group, which will help them make their choice. Members will also be able to modify their vote after initially voting if they choose to. After a movie wins the voting round, that movie can be watched at any of the other popular movie platforms like Netflix, Prime Videos, Apple TV and more.

Everything is controlled by a moderator which has the power to virtually do anything that they feel is necessary to keep the website working seamlessly. This includes the ability to invite people, add them as members in a group. Creating voting events which will end with a winning movie that the members of that group will watch. Moderator will also be able to populate the movies from the system.

Members will have the ability to see all the movies that are available currently and vote for them as soon as a movie watching event is created for their group. They will also be able to manage their profile and do basic functions like watch movie trailers and read movie reviews for the movies that they are interested in.








