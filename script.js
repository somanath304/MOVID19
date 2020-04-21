//var express=require('express');
//var app = express();

// var conn=mysql.createConnection({
// host:'localhost',
// user:'root',
// password:'password',
// database:'SampleDB'

// });

// conn.connect(function(error){
//     if(!!error){
//         console.log('Error in connecting' );
//         }else{
//             console.log('connected');
//         }

// });

// // conn.connect(function(err) {
// //     if (err) throw err;
// //     console.log("Connected!");
// //   });
  

// app.get('/',function(req,resp) {    
//     connection.query("SELECT * FROM mySampleTable", function(error,rows,fields){
//         if(!!error){
//             console.log('error in the query');
//         }else{
//             console.log('Successful query');
//         }
//  });    
     
// })

// app.listen(1337);

// var mysql = require('mysql');

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "password"
// });

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
// });


var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  /*Create a database named "mydb":*/
  // con.query("CREATE DATABASE mydb", function (err, result) {
  //   if (err) throw err;
  //   console.log("Database created");
  // });
});
//===============================================================================================================================
//var mysql = require('mysql');

// var session = require('express-session');
// var bodyParser = require('body-parser');
// var path = require('path');
// var JSAlert = require("js-alert");
// var nodemailer = require('nodemailer');
// var cookieParser = require('cookie-parser');
// var urlencodedParser = bodyParser.urlencoded({ extended: false });

// var transporter = nodemailer.createTransport({
//     host: 'smtp.gmail.com',
//     port: 465,
//     secure: true,
//     auth: {
//         user: 'chinmayaspproject@gmail.com', //email ID
//         pass: 'xyz_yourpassword' //Password 
//     }
// });

// var mysql = require('mysql');

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "password"
// });

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
//   /*Create a database named "mydb":*/
// //   con.query("CREATE DATABASE mydb", function (err, result) {
// //     if (err) throw err;
// //     console.log("Database created");
// //   });
// });
//==========================================================

// var express = require('express');
// var app = express();
// app.set('view engine', 'ejs');
// const bodyParser=require('body-parser')

// app.use(bodyParser.urlencoded({extended: false}))
 
//  app.listen(1337);
 //==========================================================

// //app.set("view", "./view");
// app.set('views', __dirname + '/views');
// //app.set("view options", { layout: false } );
// app.use(express.static(__dirname + '/public'));

// // app.get('/sup', function(request, response) {
// //   console.log("inside get signup sup");
// //   //response.sendFile(path.join(__dirname + '/signup.html'));
// //   response.render('signup');
// // });

// app.post('/sign_up', function(request, response) {
//   //var otp = Math.floor(100000 + Math.random() * 900000);
//   response.redirect('sup');
//==========================================================
// });
//working code before change
// app.get('/', function(request, response) {
//   console.log(request.body)
//   //response.render(path.join(__dirname + '/Login.ejs'));
//   response.render('sign_up.ejs');
//   console.log("in submit")
// });

// app.get('/submit', function(request, response) {
//   console.log(request.body)
//   console.log("inside post")
//   console.log(response.body)
// });
//==========================================================

 //path.join(__dirname + '/Login.ejs')
 
 ///Users/somanathjoglekar/Desktop/oop project/node js/mysql/sign_up.ejs
//  app.get('/submit', function(request, response) {
//    console.log(request.body)
//    request.render('sign_up',{title:'Datasaved',message:'data saved'})
   
//  });
//   var UserD = {
//     email: request.body.emailid,
//     password: request.body.password,
//     FirstName: request.body.fname,
//     LastName: request.body.lname,
  
// };

  // con.query("use OOP", function (err, result) {
  //   if (err) throw err;
  //   console.log("use oop executed");
  //  });
  // // con.query("Select * from Users", function (err, result,fields) {
  // //     if (err) throw err;
  // //     console.log(result);
  // //    });

  // var queryone = connection.query('INSERT INTO Users SET ?', UserD, function(error, results, fields) {
  //   console.log(results);
  // });



// app.post('/sign_up', function(request, response) {
//   console.log("inside /signup")
  
// });

// app.use(session({
//     secret: 'secret',
//     resave: true,
//     saveUninitialized: true
// }));
// app.use(bodyParser.urlencoded({ extended: true }));
// app.use(bodyParser.json());
// app.use(cookieParser());


// app.get('/sign_up', function(request, response) {
//     //response.sendFile(path.join(__dirname + '/Login.ejs'));
//     //response.render(path.join(__dirname + '/Login.ejs'));
//     response.render('Login');
// });


// app.get('/rs', function(request, response) {
//     //response.sendFile(path.join(__dirname + '/result.html'))
//     response.render('result');
// });
// app.get('/sup', function(request, response) {
//     console.log("inside get signup sup");
//     //response.sendFile(path.join(__dirname + '/signup.html'));
//     response.render('signup');
// });

// app.get('/MainSingup', function(request, response) {
//     console.log("inside get signup usersignup");
//     response.sendFile(path.join(__dirname + '/views/sign_up.ejs'));
//     //response.render('signupOne');
// });



// app.get('/test', function(request, response) {
//     response.send('you did a great job');
// });
// app.post('/VerifyOTP', function(request, response) {
//     var emailaddress = request.body.email;
//     var OTPFE = request.body.otp;

//     connection.query('SELECT otp FROM otp WHERE emailid = ?', [emailaddress], function(error, results, fields) {
//         console.log(results);
//         var rs = JSON.stringify(results);
//         var json = JSON.parse(rs);
//         for (var i = 0; i < json.length; i++) {
//             var otp = json[i]['otp'];

//         }
//         if (OTPFE == otp) {
//             response.send("OTP Matched! Please continue with Signup");
//         } else {
//             response.status(500).send('you have an error');
//         }
//     });
// });


// app.post('/signup', function(request, response) {
//     var emailaddress = request.body.emailid;
//     console.log("entered and received email address is:" + emailaddress);

//     connection.query('SELECT * FROM GWUStudents WHERE email = ?', [emailaddress], function(error, results, fields) {
//         console.log(emailaddress);
//         if (results.length == 1) {
//             connection.query('SELECT * FROM Login WHERE emailid = ?', [emailaddress], function(error, results, fields) {
//                 if (results.length == 1) {
//                     response.status(500).send('you have an error');
//                     //response.send("GWU user " + emailaddress + " is already registered, Please login");
//                 } else {
//                     var otp = Math.floor(100000 + Math.random() * 900000);
//                     var emailto = emailaddress;
//                     //console.log(otp+" "+ emailto);
//                     var code = "'" + otp + "'";
//                     var receiver = "'" + emailto + "'";
//                     //console.log(otp + " " + emailto);
//                     var details = {
//                         from: 'chinmayaspproject@gmail.com', // sender address same as above
//                         to: emailto, // Receiver's email id
//                         subject: 'OTP for AccompanyME', // Subject of the mail.
//                         html: code // Sending OTP 
//                     };

//                     transporter.sendMail(details, function(error, data) {
//                         if (error)
//                             console.log(error)
//                         else
//                             console.log(data);
//                     });
//                     connection.query('insert into otp values (?,?) on duplicate key update otp=?', [emailaddress, otp, otp], function(error, results, fields) {
//                         console.log(results);
//                     });

//                     response.send('Please enter your OTP below');
//                     console.log('Inside Signup verification');

//                 }

//             });



//             //response.redirect('/UserSignup');
//         } else {
//             console.log('Not a authorized user');
//             response.status(500).send('You are not a registered GWU student');
//             //response.send('You are not a registered GWU student');
//         }
//     });


// });


// app.get('/home', function(request, response) {

//     if (request.session.loggedin) {
//         //response.sendFile(path.join(__dirname + '/app.html'));
//         response.render('app');

//     } else {
//         response.send('Please login to view this page!');
//     }
//     //response.end();
// });

// app.get('/about', function(request, response) {

//     response.render('about');

//     //response.end();
// });


// app.post('/auth', function(request, response) {
//     var username = request.body.username;
//     var password = request.body.password;
//     console.log(username + password);
//     if (username && password) {
//         console.log(username + password);
//         connection.query('SELECT * FROM login WHERE emailid = ? AND password = ?', [username, password], function(error, results, fields) {
//             console.log(results);
//             if (results.length == 1) {
//                 request.session.loggedin = true;
//                 request.session.username = username;
//                 let users = {
//                     emailid: request.body.username
//                 }
//                 response.cookie("userData", users);
//                 console.log("Cookies: ", request.cookies);
//                 response.redirect('/home');
//                 //response.sendFile(path.join(__dirname + '/app.html'));
//             } else {
//                 response.send('Incorrect Username and/or Password!');
//             }
//             response.end();
//         });
//     } else {
//         response.send('Please enter Username and Password!');
//         response.end();
//     }
// });

// app.post('/Signup', function(request, response) {
//     //var otp = Math.floor(100000 + Math.random() * 900000);
//     response.redirect('sup');

// });



// app.post('/MainSignup', function(request, response) {

//     console.log("Inside main user details address");
//     var UserD = {
//         emailid: request.body.emailid,
//         fname: request.body.fname,
//         lname: request.body.lname,
//         address: request.body.address,
//         phone: request.body.phone
//     };

//     var loginDetails = {
//         emailid: request.body.emailid,
//         password: request.body.password,
//     };
//     var queryone = connection.query('INSERT INTO login SET ?', loginDetails, function(error, results, fields) {
//         console.log(results);
//     });
//     var querytwo = connection.query('INSERT INTO UserD SET ?', UserD, function(error, results, fields) {
//         console.log(results);
//     });




//     //response.send()
//     response.redirect('/');

// });

// app.post('/SubmitRequest', urlencodedParser, function(request, response) {
//     if (request.session.loggedin == true) {

//         var cc = JSON.stringify(request.cookies);
//         var json = JSON.parse(cc);

//         var email = json.userData.emailid;

//         var lat = request.body.latiii;
//         var lng = request.body.longiii;
//         var subcategory = request.body.subcategory;

//         console.log(request.body);
//         console.log(email);
//         var post = {
//             emailid: email,
//             lat: request.body.latiii,
//             lng: request.body.longiii,
//             category: request.body.category,
//             subcategory: request.body.subcategory
//         };
//         console.log(post);
//         var queryOne = connection.query('INSERT INTO event SET ?', post, function(error, results, fields) {});
//         var queryTwo = connection.query('SELECT * from UserD where emailid in (SELECT emailid from event where (( 3959 * acos( cos( radians(?) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(?) ) + sin( radians(?) ) * sin( radians( lat ) ) ) ) < 15000) AND (subcategory = ?) AND (emailid <> ?));', [lat, lng, lat, subcategory, email], function(error, results, fields) {
//             console.log(results);

//             if (error) {
//                 throw error;
//             } else {
//                 obj = { print: results };
//                 //response.redirect('/rs');
//                 response.render('result', obj);
//             }

//         });

//         //response.write(results);
//         //response.redirect('/rs');
//     } else {
//         response.send('Please login to view this page!');
//     }
// });



