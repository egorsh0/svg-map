/**
 * Created by egors on 20.05.2016.
 */
var mysql      = require('mysql');
var select = 'SELECT * FROM `territory` WHERE `nameHouse`=?';
module.exports = {
    getData:function (id, res) {
        var connection = mysql.createConnection({
            host     : 'localhost',
            user     : 'egorsh',
            password : '787898',
            database : 'map'
        });

        connection.connect();

        connection.query(select, id, function(err, row) {
            var stringData = row[0].description;
            res.end(JSON.stringify({name:stringData}));
            connection.end();
        });
    }
};