var http = require("http");
http.createServer(function(request,response){
	response.writeHead(200,{'Content-Type':'text/plain'});
	response.end('hello world \n');

}).listen(8082);

console.log("server running http:\\127.0.0.1:8082");
