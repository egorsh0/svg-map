/**
 * Created by egors on 20.05.2016.
 */
var http = require('http');
var static = require('node-static');
var file = new static.Server('./static');
var sql = require('./sql');
var fs = require('fs');
var path = require('path');

var headers = {
    'Content-Type': 'text/plain',
    'Cache-Control': 'no-cache'
};

function processGetData(req, res) {
    res.writeHead(200, headers);
    var id = req.url.split('?')[1].split('=')[1];
    if((id == '2224') || (id == '2201')){
        var dean = fs.readFileSync('static/deansOffice/'+ id+'/Декан.txt', 'utf8');
        var depDean = fs.readFileSync('static/deansOffice/'+ id+'/Заместители.txt', 'utf8');
        var contacts = fs.readFileSync('static/deansOffice/'+ id+'/Контакты.txt', 'utf8');
        res.end(JSON.stringify({
            dean: dean,
            depDean: depDean,
            contacts: contacts
        }));
    }else {
        var nameMap = req.url.split('map')[1].split('=')[1];
        if (nameMap == 'corp')
            sql.getDataFromCorp(id, res);
        else
            sql.getDataFromRoom(id, res);
    }
}

http.createServer(function(req, res) {
    if(req.url.indexOf("/getData") > -1)
        processGetData(req, res);
    else
        file.serve(req, res);
    console.log(req.toString());
}).listen(8080);

console.log('Server running on port 8080');