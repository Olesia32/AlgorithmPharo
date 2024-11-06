Class {
	#name : 'TextProcessingTest',
	#superclass : 'TestCase',
	#category : 'AlgorithmPackage',
	#package : 'AlgorithmPackage'
}

{ #category : 'tests' }
TextProcessingTest >> testCountDigits [

	self assert: (TextProcessing countDigits: '123abc45') equals: 5.
	self assert: (TextProcessing countDigits: 'abc') equals: 0.
	self assert: (TextProcessing countDigits: '1234567890') equals: 10
]

{ #category : 'tests' }
TextProcessingTest >> testFindLongestWord [

	self
		assert: (TextProcessing findLongestWord: 'This is a test sentence')
		equals: 'sentence'.
	self
		assert: (TextProcessing findLongestWord: 'short words')
		equals: 'short'.
	self assert: (TextProcessing findLongestWord: '') equals: ''
]

{ #category : 'tests' }
TextProcessingTest >> testFormattedPrintNumberBaseWidthUpcase [

	| result |
	result := TextProcessing
		          formattedPrint: 'Результат: '
		          number: 123
		          base: 10
		          width: 0
		          upcase: false.
	self assert: result equals: 'Результат: 123'.

	result := TextProcessing
		          formattedPrint: 'Результат: '
		          number: 5
		          base: 2
		          width: 8
		          upcase: false.
	self assert: result equals: 'Результат:      101'.

	result := TextProcessing
		          formattedPrint: 'Результат: '
		          number: 255
		          base: 16
		          width: 4
		          upcase: true.
	self assert: result equals: 'Результат:   FF'.

	result := TextProcessing
		          formattedPrint: 'Результат: '
		          number: -42
		          base: 10
		          width: 6
		          upcase: false.
	self assert: result equals: 'Результат:    -42'.

	result := TextProcessing
		          formattedPrint: 'Результат: '
		          number: 0
		          base: 10
		          width: 4
		          upcase: false.
	self assert: result equals: 'Результат: 0000'
]

{ #category : 'tests' }
TextProcessingTest >> testRecognizeInteger [

	self assert: (TextProcessing recognizeInteger: '123') equals: 123.
	self assert: (TextProcessing recognizeInteger: '-456') equals: -456.
	self assert: (TextProcessing recognizeInteger: 'abc') equals: 0
]

{ #category : 'tests' }
TextProcessingTest >> testReplaceCharacterWith [

	self
		assert:
		(TextProcessing replace: 'hello world' character: $o with: 'oo')
		equals: 'helloo woorld'.
	self
		assert: (TextProcessing replace: 'Pharo' character: $a with: 'or')
		equals: 'Phorro'.
	self
		assert: (TextProcessing replace: 'test' character: $x with: 'y')
		equals: 'test'
]

{ #category : 'tests' }
TextProcessingTest >> testSumOfIntegersInString [

	self
		assert: (TextProcessing sumOfIntegersInString: '10 -20 30')
		equals: 20.
	self
		assert: (TextProcessing sumOfIntegersInString: '5 abc 15')
		equals: 20.
	self
		assert: (TextProcessing sumOfIntegersInString: '0 0 0')
		equals: 0
]

{ #category : 'tests' }
TextProcessingTest >> testWordCount [

	self assert: (TextProcessing wordCount: 'This is a test') equals: 4.
	self assert: (TextProcessing wordCount: 'OneWord') equals: 1.
	self assert: (TextProcessing wordCount: '') equals: 0
]
