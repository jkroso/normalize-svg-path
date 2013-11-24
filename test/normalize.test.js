
var parse = require('parse-svg-path')
var cases = require('./cases')
var normalize = require('..')
var eql = require('equals')
var str = JSON.stringify

describe('normalize', function(){
	Object.keys(cases).forEach(function(key){
		var code = cases[key].reduce(function(str, obj){
			if (!obj.to) return str
			return str 
				+ 'var from = parse("' + obj.from + '")\n'
				+ 'var to = parse("' + obj.to + '")\n'
				+ (obj.debug ? 'debugger\n' : '')
				+ 'assert(normalize(from), to)\n'
		}, '(function(){\n') + '})'
		it(key, eval(code))
	})
})

function assert(a, b){
	if (!eql(a, b)) throw new Error(str(a) + ' != ' + str(b))
}
