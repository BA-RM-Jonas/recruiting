/*
    http & fs für den Webserver generell und den Zugriff auf das Filesystem auf meinem Rechner.
*/
const http = require('http');
const fs = require('fs');
const hostname = '127.0.0.1';
const port = 3000;

/*
mysql für die Verbindung zum MySQL Server auf dem Localhost.
*/
const mysql = require('mysql');

/*
con wird die Verbindung zum MySQL-Server mit den folgenden Anmeldedaten.
*/
const con = mysql.createConnection({
    host:"localhost",
  /*  user:"node",
    password:"password",*/
    user:"root",
    password:"root",
    database:"recruitingdb"
});

/*
die Verbindung zum MySQL-Server wird genutzt, um eine Query zu senden und die Ergebnisse zu erhalten.
*/
con.connect(function(err){
    if(err){
        throw err;
    } 
    console.log("Connected to SQL-DB!");
    
    var result = [];
    var fields = [];
    /*Ausführen der eigentlichen Query*/
    con.query("Select * from test;", function (err, result, fields){
        if(err){
          throw err;  
        }        
        console.log("Erster Datensatz: "+ result[1]);
    con.end();
        console.log("Connection ended!");
    })
});


/*
Wir setzen den Webserver statisch auf
*/

fs.readFile('index.html', (err, html) => {
    if(err){
        throw err;
    }
    
    const server = http.createServer((req, res) => {
    res.statusCode=200;
    res.setHeader('Content-type', 'text/html');
    res.write(html);
        console.log("Die Website wurde aufgerufen!")
        res.end();
});

server.listen(port, hostname, ()=>{
    console.log('Server started on port '+ port);
});
});
