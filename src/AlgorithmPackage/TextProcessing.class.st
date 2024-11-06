Class {
	#name : 'TextProcessing',
	#superclass : 'Object',
	#category : 'AlgorithmPackage',
	#package : 'AlgorithmPackage'
}

{ #category : 'as yet unclassified' }
TextProcessing class >> countDigits: aString [
	"Підраховує кількість цифр у рядку aString.
    Повертає загальну кількість знайдених цифр."

	| digitsQuantity |
	digitsQuantity := 0.
	aString do: [ :char |
		char isDigit ifTrue: [ digitsQuantity := digitsQuantity + 1 ] ].
	^ digitsQuantity
]

{ #category : 'as yet unclassified' }
TextProcessing class >> findLongestWord: aString [
	"Знаходить найдовше слово в рядку aString. Словом вважається
    послідовність символів, розділена пробілами. Якщо кілька слів
    мають однакову максимальну довжину, повертає перше з них."

	| words maxWord |
	words := aString substrings.
	maxWord := ''.
	words do: [ :word |
		word size > maxWord size ifTrue: [ maxWord := word ] ].
	^ maxWord
]

{ #category : 'as yet unclassified' }
TextProcessing class >> formattedPrint: aString number: number base: base width: width upcase: upcase [
	"Форматує рядок aString, додаючи до нього число number, представлене в заданій системі числення (визначеній параметром base).
    Підтримує системи числення з основами від 2 до 36, додає пробіли для вирівнювання до width, та використовує великі літери, якщо upcase є істинним."

	| formattedNumber digitStr rightmostDigit absoluteNumber negative |
	(base < 2 or: [ base > 36 ]) ifTrue: [
		^ self error: 'Неправильне значення основи' ].

	number = 0 ifTrue: [
		formattedNumber := String new: (width max: 1) withAll: $0.
		^ aString , formattedNumber ].

	negative := number < 0.
	absoluteNumber := negative
		                  ifTrue: [ number negated ]
		                  ifFalse: [ number ].

	formattedNumber := ''.
	[ absoluteNumber > 0 ] whileTrue: [
		rightmostDigit := absoluteNumber \\ base.
		digitStr := rightmostDigit < 10
			            ifTrue: [
			            (Character digitValue: rightmostDigit) asString ]
			            ifFalse: [
				            (Character value: (upcase
						              ifTrue: [ 65 ]
						              ifFalse: [ 97 ]) + rightmostDigit - 10) asString ].
		formattedNumber := digitStr , formattedNumber.
		absoluteNumber := absoluteNumber // base ].

	negative ifTrue: [ formattedNumber := '-' , formattedNumber ].

	formattedNumber := (String
		                    new: (width - formattedNumber size max: 0)
		                    withAll: $ ) , formattedNumber.

	^ aString , formattedNumber
]

{ #category : 'as yet unclassified' }
TextProcessing class >> recognizeInteger: aString [
	"Розпізнає та конвертує рядок aString у ціле число, обробляючи знак '-' для від'ємних чисел.
    Якщо рядок містить нечислові символи, вони ігноруються.
    Повертає ціле число з відповідним знаком."

	| sign result |
	result := 0.
	sign := aString first = $-
		        ifTrue: [ -1 ]
		        ifFalse: [ 1 ].

	aString doWithIndex: [ :char :i |
		char isDigit ifTrue: [ result := result * 10 + char digitValue ] ].

	^ result * sign
]

{ #category : 'as yet unclassified' }
TextProcessing class >> replace: aString character: oldChar with: newChars [
	"Замінює всі входження символу oldChar у рядку aString на послідовність newChars.
    Повертає модифікований рядок після виконання замін."

	| result |
	result := WriteStream on: String new.
	aString do: [ :char |
		char = oldChar
			ifTrue: [ result nextPutAll: newChars ]
			ifFalse: [ result nextPut: char ] ].
	^ result contents
]

{ #category : 'as yet unclassified' }
TextProcessing class >> sumOfIntegersInString: aString [
	"Обчислює суму всіх цілих чисел, знайдених у рядку aString.
    Повертає суму всіх розпізнаних цілих чисел у рядку."

	| sum words |
	sum := 0.
	words := aString findTokens: ' '.
	words do: [ :word |
		| number |
		number := (word matchesRegex: '^-?\d+$')
			          ifTrue: [ word asInteger ]
			          ifFalse: [ 0 ].
		sum := sum + number ].
	^ sum
]

{ #category : 'as yet unclassified' }
TextProcessing class >> wordCount: aString [
"Підраховує загальну кількість слів у рядку aString.
    Повертає кількість слів."
	| words |
	words := aString substrings.
	^ words size
]
