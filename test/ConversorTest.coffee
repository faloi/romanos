class RomanConverter
	convert: (aNumber) ->
		if (aNumber < 4)
			@generateI aNumber
		else if (aNumber == 4)
			'IV'
		else
			'V' + @generateI(aNumber - 5)

	generateI: (quantity) ->
		times = if (quantity == 0) then [] else [1..quantity]
		times.reduce ((acum, _) -> acum + 'I'), ''

beforeEach ->
	@addMatchers
		toEqualRoman: (expectedRomanNumber) ->
			actualRomanNumber = new RomanConverter().convert(@actual)

			@message = -> 
				"#{@actual} is #{expectedRomanNumber} in Roman numbers, but was #{actualRomanNumber}"

			actualRomanNumber == expectedRomanNumber

describe "testXXX", ->
	it 'test1', ->
		expect(1).toEqualRoman 'I' 
	
	it 'test2', ->
		expect(2).toEqualRoman 'II' 

	it 'test3', ->
		expect(3).toEqualRoman 'III' 

	it 'test4', ->
		expect(4).toEqualRoman 'IV' 

	it 'test5', ->
		expect(5).toEqualRoman 'V' 

	it 'test6', ->
		expect(6).toEqualRoman 'VI' 

	it 'test7', ->
		expect(7).toEqualRoman 'VII' 

	it 'test8', ->
		expect(8).toEqualRoman 'VIII' 		

