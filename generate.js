var modules_dir = '/usr/local/node/lib/node_modules';
var fs = require('fs');
var jqtpl = require(modules_dir + '/jqtpl');

if (process.argv.length < 4) {
  console.error('Please provide template filenamei and the json data');
  process.exit(1);
}

var tpl = fs.readFileSync(process.argv[2], 'utf-8');
var info_text = fs.readFileSync(process.argv[3], 'utf-8');
var info = JSON.parse(info_text);

var result = jqtpl.tmpl(tpl, info, 
{
  camelize: function () {
    var s = arguments[0];
    return s.substring(0,1).toLowerCase() + s.substring(1);
  },
  capitalize: function () {
    var s = arguments[0];
    return s.substring(0,1).toUpperCase() + s.substring(1);
  }
});
console.log(result);
