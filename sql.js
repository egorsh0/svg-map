/**
 * Created by egors on 20.05.2016.
 */
var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'egorsh',
    password : '787898',
    database : 'map'
});

connection.connect();

connection.query('SELECT * FROM `teacher` WHERE `teacherCode`=?', [4], function(err, row) {
    if (err) throw err;
    console.dir({queryRow:row});
});

connection.end();