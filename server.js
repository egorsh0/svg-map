/**
 * Created by egors on 20.05.2016.
 */
var http = require('http');
var static = require('node-static');
var file = new static.Server('./static');
var sql = require('./sql');

var headers = {
    'Content-Type': 'text/plain',
    'Cache-Control': 'no-cache'
};

function processGetData(req, res) {
    res.writeHead(200, headers);
    var id = req.url.split('?')[1].split('=')[1];
    sql.getData(id, res);
}

http.createServer(function(req, res) {
    if(req.url.indexOf("/getData") > -1)
        processGetData(req, res);
    else
        file.serve(req, res);
    console.log(req.toString());
}).listen(8080);

console.log('Server running on port 8080');