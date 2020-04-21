const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 1323
var mysql = require('mysql');
var nodemailer = require('nodemailer');



app.use(bodyParser.urlencoded({extended :false}))
app.use(express.static('images'));

//app.set('view engine', 'pug')

app.set('view engine', 'ejs')


  app.get('/', function (req, res) {
    res.sendFile('sign_up.html', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
    console.log("waiting on sign_up")
  })

  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "password",
    database:'OOP'
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    
  });

   app.post('/abc', function (req, res) {
    console.log("on post abc")
       console.log(req.body)
       //console.log(req.body.email)
        var sql="insert into Users values(null,'" + req.body.FirstName + "','" + req.body.LastName + "','" + req.body.email + "','" + req.body.password + "','" + req.body.Moderator + "',1,null)";
        con.query(sql, function (err, rows, fields) { 
        if (err) throw err
        res.sendFile('login.html', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
        //res.render('index', { title: 'Data saved', message: 'SIGN UP DONE Click on back button to goto login This page is index.pug',})
        //res.render(req.body.email)
        
        })
     
   })

   app.get('/login', function (req, res) {
    //console.log("on login")
    res.sendFile('login.html', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
    //res.render('login.html', { title: 'Login page', message: 'Login',})
    //console.log(req.body)
   })

   app.post('/login', function (req, res) {
    //console.log("on login post ")
    
    var email = req.body.email;
    var password = req.body.password;
    var usertype_local=req.body.gender;
    //console.log(usertype_local) 
    //res.sendFile('index.html',{ root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
    if (email && password) {
        con.query('SELECT * FROM Users WHERE email = ? AND passcode = ?', [email, password], function(error, results, fields) {
            var usertype=(results[0].usertype);
            //console.log(results)
            if (results.length == 1) {
                //console.log(usertype)
                if((usertype=="Moderator") && (usertype_local=="female")){
                  //console.log("inside mod")
                res.sendFile('landing_page.html',{ root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
              }
              if((usertype=="Member") && (usertype_local=="male")){
                //console.log("Normal user")
                res.sendFile('User_landing_page.html',{ root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
              }
            } else {
                res.render('login', { title: 'Login page', message: 'Invalid User',}) 
            }
            
        });
    } else {
      res.render('login', { title: 'Login page', message: 'Enter Username and Password',}) 
        
    }
   })

   app.post('/members', function (req, res) {
    console.log("on members post ")
    
    var email = req.body.email;
    console.log(email)

    var transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'somanath.joglekar@gmail.com',
        pass: 'Rachana123'
      }
      
    });

    var mailOptions = {
      from: 'somanath.joglekar@gmail.com',
      to: email,
      subject: 'Invite from Movie Manager',
      text: 'Click on this link to sign-up http://localhost:1323/'
    };


transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
    
   })

   app.post('/cg', function (req, res) {
    console.log("on create group ie cg")
       console.log(req.body)
       //console.log(req.body.email)
       var GroupName=req.body.GroupName;
       var Create_date=req.body.birthday;
       console.log(GroupName)
       console.log(Create_date)

       if (GroupName && Create_date)  {
        
        var sql="insert into mwgroup values(null,'" + GroupName + "',1,null,'" + Create_date + "',null)";
        
        con.query(sql, function (err, rows, fields) { 
        if (err) throw err
        //res.render('index', { title: 'Data saved', message: 'Group created',})
        //res.render(req.body.email)
        
        })
    } 
     
   })

   app.post('/Manage_group', function (req, res) {
    console.log("on manage groups ")
    con.query("SELECT * FROM mwgroup", function(error, mwgroup, fields) {
      if (error) throw error
      //console.log(mwgroup);
      //res.render('manage_group',{ title:'Group Details',items:mwgroup})
      
      // res.sendFile('manage_group', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' },{
      //   title:'Group Details',items:rows})
      //res.render('manage_group.html',{items:rows})
      con.query("SELECT * FROM Users", function(error, Users, fields) {
        if (error) throw error
        //console.log(Users);
        
      res.render('manage_group',{ title:'User Details',Users:Users,mwgroup:mwgroup})
        
    //     // res.sendFile('manage_group', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' },{
    //     //   title:'Group Details',items:rows})
    //     //res.render('manage_group.html',{items:rows,})
        
        
    // });
      
  });
});

 
   })

   app.post('/Add_Member', function (req, res) {
    console.log("on add memeber")
    
    //console.log(req.body.MemberID)
    //console.log(req.body.group_id)

    var sql="insert into partof values(null,'" + req.body.group_id + "','" + req.body.MemberID + "')";
    con.query(sql, function (err, rows, fields) { 
    if (err) throw err
    con.query("select g.mwgroupid, g.mwgroupname, count(p.memberid) as mem_count from members as m, partof as p, mwgroup as g where m.memberid=p.memberid and p.mwgroupid=g.mwgroupid group by g.mwgroupid", function(error, movies, fields) {
      if (error) throw error
      //console.log(movies);
      
    res.render('Add_member',{ title:'Add Member Details',movies:movies,})      
  });
});

   })

   app.post('/Create_Event', function (req, res) {
    console.log("on Create Event")
    var sql="insert into mwevent values(null,'" + req.body.closevotedate + "','" + req.body.openvotedate + "','" + req.body.moviedate + "','" + req.body.mweventname + "',true,'" + req.body.mweventdate + "',null,null,'" + req.body.mwgroupid + "')";
    con.query(sql, function (err, rows, fields) { 
    if (err) throw err
    //res.render('index', { title: 'Data saved', message: 'Event Created',})
    //res.render(req.body.email)

    })

  //   con.query(sql, function (err, rows, fields) { 
  //     if (err) throw err
  //     con.query("select g.mwgroupid, g.mwgroupname, e.mweventid, e.mweventname from mwevent as e, mwgroup as g where e.mwgroupid=g.mwgroupid", function(error, movies, fields) {
  //       if (error) throw error
  //       //console.log(movies);
        
  //     res.render('After_create_event',{ title:'Add Member Details',movies:movies,})      
  //   });
  // });
    //console.log(req.body)

   })

   app.post('/Populate_movies', function (req, res) {
    console.log("on populate movies ")

      con.query("select m.movieid,m.moviename,m.releasedate,t.trailerurl,r.reviewurl from movie AS m, trailers AS t, reviews AS r where m.movieid=t.movieid and m.movieid=r.movieid", function(error, movies, fields) {
        if (error) throw error
        //console.log(movies);
        
      res.render('populate_movie2',{ title:'Movie Details',movies:movies})
      //res.sendFile('populate_movie2', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })      
    });

   })

   app.post('/Vote_event', function (req, res) {
    console.log("on Vote Event Page ")
    con.query("select m.movieid,m.moviename,m.releasedate,t.trailerurl,r.reviewurl from movie AS m, trailers AS t, reviews AS r, mwevent as e, mwgroup as g, contain as c where m.movieid=t.movieid and m.movieid=r.movieid and e.mwgroupid=g.mwgroupid  and e.mweventid=c.mweventid and c.movieid=m.movieid and g.mwgroupid=1 and e.mweventid=1", function(error, movies, fields) {
      if (error) throw error
      //console.log(movies);
      
    res.render('vote_event',{ title:'Movie Details',movies:movies})      
  });
      
   })
   
   app.post('/Vote_for_movie', function (req, res) {
     
      var movie_id=req.body.Movie_id;
      var password=req.body.password;
      console.log(movie_id)
      console.log(password)
      var curday = function(sp){
        today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //As January is 0.
        var yyyy = today.getFullYear();
        
        if(dd<10) dd='0'+dd;
        if(mm<10) mm='0'+mm;
        return (yyyy+sp+mm+sp+dd);
        };
      var curday2=(curday('-'))

      con.query("select memberid from Users where passcode ='" + password + "' " , function(error, Users, fields) {
        if (error) throw error
        var member_id=Users[0].memberid

        con.query("select e.mweventid from members as m, partof as p, mwgroup as g, mwevent as e where m.memberid=p.memberid and p.mwgroupid=g.mwgroupid and g.mwgroupid=e.mwgroupid and m.memberid='" + member_id + "'", 
          function(error, get_eventID, fields) {
          if (error) throw error
          console.log(get_eventID)
          var mw_event_id=get_eventID[0].mweventid

        con.query("select datediff(date(closevotedate),date('" + curday2 + "' )) as votedate from mwevent where mweventid='" + mw_event_id + "'", 
          function(error, vote_time, fields) {
          if (error) throw error
          console.log("passing vote date")
          console.log(curday2)
          console.log(vote_time[0].votedate)
          var vote_time=vote_time[0].votedate
          console.log(vote_time)
          if(vote_time<=0){
            //res.render('vote_time_expired', { title: 'Voting Time Expired', message: 'Voting Time Expired',})
            res.sendFile('vote_time_expired.html', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
            console.log("came back from vote_time_expiredd")
          }else{
        var insert_vote="insert into vote values (null,'" + member_id + "',null )";
        con.query(insert_vote, function (err, rows, fields) { 
          if (err) throw err
          console.log("got the memberid")
          
          })
          console.log("abc")
        con.query("select voteid from vote where memberid ='" + member_id + "'" , function(error, vote, fields) {
          if (error) throw error
          var vote_id_1=vote[0].voteid
          console.log(vote_id_1)
          console.log("xyz")
          var ayu="insert into gets values (null,'" + vote_id_1 + "','" + movie_id + "' )";
        con.query(ayu, function (err, rows, fields) { 
          if (err) throw err
          
          })
        });
      }
});
});
});

  });
      
  app.post('/modify_vote', function (req, res) {
    console.log("on populate movies ")

      con.query("select m.movieid,m.moviename,m.releasedate,t.trailerurl,r.reviewurl from movie AS m, trailers AS t, reviews AS r, mwevent as e, mwgroup as g, contain as c where m.movieid=t.movieid and m.movieid=r.movieid and e.mwgroupid=g.mwgroupid  and e.mweventid=c.mweventid and c.movieid=m.movieid and g.mwgroupid=1 and e.mweventid=1", function(error, movies, fields) {
        if (error) throw error
        //console.log(movies);
        
      res.render('modify_vote_page',{ title:'Movie Details',movies:movies})      
    });

   })

  app.post('/modify_vote_button', function (req, res) {
    
    console.log("on modify vote")
    var movie_id=req.body.Movie_id;
    var password=req.body.password;
    console.log(movie_id)
    console.log(password)

    con.query("select memberid from Users where passcode ='" + password + "' " , function(error, Users, fields) {
      if (error) throw error
      var member_id=Users[0].memberid

      con.query("select voteid from vote where memberid ='" + member_id + "'" , function(error, vote, fields) {
        if (error) throw error
        var vote_id_1=vote[0].voteid
        console.log(vote_id_1)

        var ayu="update gets set movieid ='" + movie_id + "' where voteid='" + vote_id_1 + "'";
      con.query(ayu, function (err, rows, fields) { 
        if (err) throw err
        
        })
       

});
});
});


app.post('/Winner', function (req, res) {
  console.log("on winner ")

    con.query("select g.mwgroupid, g.mwgroupname, e.mweventid, e.mweventname from mwevent as e join mwgroup as g where e.mwgroupid=g.mwgroupid", 
    function(error, show_group_and_events, fields) {
     if (error) throw error
      //console.log(show_group_and_events);
      
    res.render('winner_page',{ title:'Movie Details',show_group_and_events:show_group_and_events})      
 });

 })


app.post('/group_event_id', function (req, res) {
  console.log("on group ID ")

  var group_id=req.body.group_id
  var event_id=req.body.event_id
  var winner;
  //console.log(req.body)
  con.query("select u.firstname, u.lastname, mov.moviename from users as u, members as m, vote as v, gets as g, movie as mov, contain as c, mwevent as e, partof as p where p.memberid=m.memberid and p.mwgroupid='" + group_id + "' and m.memberid=u.memberid and m.memberid=v.memberid  and v.voteid=g.voteid  and g.movieid=mov.movieid and mov.movieid=c.movieid and c.mweventid=e.mweventid and e.mweventid='" + event_id + "'", 
  function(error, members, fields) {
   if (error) throw error
    //console.log(all_movies_voted_by_members);
    //res.render('winner_page_2',{ title:'Movie Details',all_movies_voted_by_members:all_movies_voted_by_members})
    con.query("select mov.moviename, count(distinct v.voteid) as votecount from users as u, members as m, vote as v, gets as g, movie as mov, contain as c, mwevent as e, partof as p where p.memberid=m.memberid and p.mwgroupid='" + group_id + "' and m.memberid=u.memberid and m.memberid=v.memberid  and v.voteid=g.voteid and g.movieid=mov.movieid and mov.movieid=c.movieid and c.mweventid=e.mweventid and e.mweventid='" + event_id + "' group by mov.moviename", 
    function(error, votes, fields) {
   if (error) throw error
    console.log(votes);
    //res.render('winner_page_2',{ title:'Movie Details',members:members,votes:votes})

    //res.render('manage_group',{ title:'User Details',Users:Users,mwgroup:mwgroup})
    con.query("select max(votecount) as vote_count from (select count(distinct v.voteid) as votecount, mov.moviename as winner from users as u, members as m, vote as v, gets as g, movie as mov, contain as c, mwevent as e, partof as p where p.memberid=m.memberid and p.mwgroupid=1 and m.memberid=u.memberid and m.memberid=v.memberid  and v.voteid=g.voteid  and g.movieid=mov.movieid and mov.movieid=c.movieid and c.mweventid=e.mweventid and e.mweventid=1 group by mov.moviename) as table2", 
    function(error, som, fields) {
   if (error) throw error
   console.log(som[0].vote_count)
   console.log(votes[3].votecount)
    //res.render('manage_group',{ title:'User Details',Users:Users,mwgroup:mwgroup})
    for (i = 0; i < votes.length; i++) {
      if(som[0].vote_count==votes[i].votecount){
        console.log("winner is")
        winner=(votes[i].moviename)
        break; 
      }
    }

    con.query("truncate winner" , function(error, Users, fields) {
      if (error) throw error});

    var win="insert into winner values('" + winner + "')";
        con.query(win, function (err, win_res, fields) { 
          if (err) throw err
          })
    
          con.query("select winner_movie from winner", 
          function(error, win_result, fields) {
          if (error) throw error
          console.log(win_result)
        
    res.render('winner_page_2',{ title:'Movie Details',members:members,votes:votes,win_result:win_result})
  
    });
  });
  });
    
});


 })

 app.post('/log_out', function (req, res) {
  console.log("on logout")
  res.sendFile('login.html', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
  //res.render('login.html', { title: 'Login page', message: 'Login',})
  //console.log(req.body)
 })

 app.post('/unsubscribe', function (req, res) {

  res.render('unsubscribe',{ title:'Unsubscribe Page',})


})

app.post('/unsubscribe_button', function (req, res) {

  var group_id=req.body.Group_ID
  var password=req.body.password  

  // console.log(group_id)
  // console.log(password)

  con.query("select memberid from Users where passcode ='" + password + "' ", 
  function(error, Users, fields) {
   if (error) throw error
    console.log(Users);
    var member_id=Users[0].memberid
    console.log(member_id)

    con.query("delete from partof where mwgroupid='" + group_id + "' and memberid='" + member_id + "'", 
    function(error, Users, fields) {
     if (error) throw error
     
  });
  
});

})


 app.get('/go_back', function (req, res) {
  //console.log("on login")
  res.sendFile('login.html', { root : '/Users/somanathjoglekar/Desktop/oop project/node js/mysql' })
  //res.render('login.html', { title: 'Login page', message: 'Login',})
  //console.log(req.body)
 })

 app.get('/About', function (req, res) {

  res.render('About_page',{ title:'About Page',})
  
 })

 app.get('/contact_us', function (req, res) {
 
  res.render('contant_us_page',{ title:'Contact Us',})

 })

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))




