/**
 * Created by egors on 20.05.2016.
 */
var http = require('http');
var static = require('node-static');
var file = new static.Server('./static');

function process(req, res) {

    res.writeHead(200, {
        'Content-Type': 'text/plain',
        'Cache-Control': 'no-cache'
    });

    res.end("OK");
}

http.createServer(function(req, res) {
    if(req.url.indexOf("/data") > -1)
        process(req, res);
    else
        file.serve(req, res);
    console.log(req.toString());
}).listen(8080);

console.log('Server running on port 8080');