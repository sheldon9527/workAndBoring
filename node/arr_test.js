var crypto=require('crypto');
var fs=require('fs');

var arr=[0x0,0x0,0x4d,0x67,0x0,0x0,0xa,0x28,0x5a,0x73,0xde,0x69,0x57,0xdc,0x4a,0x85];

const srcdata = new Buffer(arr, 'binary');

var md5= crypto.createHash('md5').update(srcdata).digest('hex');

console.log(md5)

fs.writeFileSync('md5',srcdata, 'binary');

var data=fs.readFileSync('md5', 'binary');

md5= crypto.createHash('md5').update(data).digest('hex');

console.log(md5)
