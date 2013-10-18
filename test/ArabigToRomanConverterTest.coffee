beforeEach ->
	@addMatchers
		toEqualRoman: (expectedRomanNumber) ->
			actualRomanNumber = new ArabigToRomanConverter().convert(@actual)

			@message = -> 
				"#{@actual} is #{expectedRomanNumber} in Roman numbers, but the result was #{actualRomanNumber}"

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
		expect(16).toEqualRoman 'XVI'
		expect(18).toEqualRoman 'XVIII'
		expect(19).toEqualRoman 'XIX'
		expect(20).toEqualRoman 'XX'
		expect(23).toEqualRoman 'XXIII'
		expect(24).toEqualRoman 'XXIV'
		expect(34).toEqualRoman 'XXXIV'

	it 'test16', ->
		expect(64).toEqualRoman 'LXIV'		
		expect(80).toEqualRoman 'LXXX'		
		expect(81).toEqualRoman 'LXXXI'		
		expect(99).toEqualRoman 'XCIX'		

	it 'test19', ->
		expect(100).toEqualRoman 'C'
		expect(200).toEqualRoman 'CC'		
		expect(250).toEqualRoman 'CCL'		
		expect(897).toEqualRoman 'DCCCXCVII'		
		expect(999).toEqualRoman 'CMXCIX'		