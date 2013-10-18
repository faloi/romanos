convertToRoman = (aNumber) ->
	if (aNumber < 4)
		[1..aNumber].reduce ((acum, _) -> acum + 'I'), ''
	else
		'IV'

beforeEach ->
	@addMatchers
		toEqualRoman: (expectedRomanNumber) ->
			convertToRoman @actual == expectedRomanNumber

describe "testXXX", ->
	it 'test1', ->
		expect(1).toEqualRoman 'I' 
	
	it 'test2', ->
		expect(2).toEqualRoman 'II' 

	it 'test3', ->
		expect(3).toEqualRoman 'III' 

	it 'test4', ->
		expect(4).toEqualRoman 'IV' 

