Array::sum = ->
	@.reduce ((acum, elem) -> acum + elem), 0

class RomanConverter
	symbols: () ->
		[
			arab: 0, roman: ''
		,
			arab: 1, roman: 'I'
		,
			arab: 5, roman: 'V'
		,
			arab: 10, roman: 'X'
		]

	findRomanFor: (aNumber) ->
		@symbols().filter((it) -> it.arab == aNumber)[0].roman

	isBorderNumber: (aNumber) ->
		(aNumber + 1) % 5 == 0

	convert: (aNumber) ->
		if (aNumber < 4)
			@make aNumber
		else if (aNumber == 4)
			'IV'
		else if (aNumber <= 8)
			@make aNumber
		else if (aNumber == 9)
			'IX'
		else if (aNumber <= 13)
			@make aNumber
		else if (aNumber == 14)
			'XIV'
		else if (aNumber <= 18)
			@make aNumber
		else if (aNumber == 19)
			'XIX'
		else if (aNumber <= 23)
			@make aNumber
		else
			'XXIV'

	make: (aNumber)	->
		base = switch 
			when aNumber <= 3 then [0]
			when aNumber <= 8 then [5]
			when aNumber <= 13 then [10]
			when aNumber <= 18 then [10, 5]
			when aNumber <= 23 then [10, 10]

		romanBase = base.reduce ((acum, elem) => acum + @findRomanFor(elem)), ''

		romanBase + @generateI aNumber - base.sum()

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

	it 'test9', ->
		expect(9).toEqualRoman 'IX' 		

	it 'test10', ->
		expect(10).toEqualRoman 'X' 		

	it 'test11', ->
		expect(11).toEqualRoman 'XI' 		

	it 'test12', ->
		expect(12).toEqualRoman 'XII' 		

	it 'test13', ->
		expect(13).toEqualRoman 'XIII' 		

	it 'test14', ->
		expect(14).toEqualRoman 'XIV'

	it 'test15', ->
		expect(15).toEqualRoman 'XV'

	it 'test16', ->
		expect(16).toEqualRoman 'XVI'

	it 'test17', ->
		expect(18).toEqualRoman 'XVIII'

	it 'test18', ->
		expect(19).toEqualRoman 'XIX'

	it 'test19', ->
		expect(20).toEqualRoman 'XX'

	it 'test20', ->
		expect(23).toEqualRoman 'XXIII'

	it 'test21', ->
		expect(24).toEqualRoman 'XXIV'