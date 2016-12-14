var fs = require("fs");

fs.readFile('file.txt',function(error,data){

	if(error) return console.error(error);

	console.log(data.toString());

});
