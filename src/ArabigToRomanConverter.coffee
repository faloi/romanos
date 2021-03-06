Number::div = (divisor) ->
	@ / divisor | 0

class ArabigToRomanConverter
	convertDigit: (aNumber, I, V, X) ->
		if (aNumber < 4)
			@generate I, aNumber
		else if (aNumber == 4)
			"#{I}#{V}"
		else if (aNumber <= 8)
			"#{V}" + @generate I, aNumber - 5
		else if (aNumber == 9)
			"#{I}#{X}"

	convertUnit: (aUnit) ->
		@convertDigit aUnit, 'I', 'V', 'X'

	convertTen: (aTen) ->
		@convertDigit aTen, 'X', 'L', 'C'

	convertCenten: (aCenten) ->
		@convertDigit aCenten, 'C', 'D', 'M'

	convert: (aNumber) ->
		@convertCenten(aNumber.div(100) % 10) + @convertTen(aNumber.div(10) % 10) + @convertUnit(aNumber.div(1) % 10)

	generate: (symbol, quantity) ->
		times = if (quantity == 0) then [] else [1..quantity]
		times.reduce ((acum, _) -> acum + symbol), ''
