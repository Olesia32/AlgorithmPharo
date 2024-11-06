Class {
	#name : 'TextProcessing',
	#superclass : 'Object',
	#category : 'AlgorithmPackage',
	#package : 'AlgorithmPackage'
}

{ #category : 'as yet unclassified' }
TextProcessing class >> countDigits: aString [ 
        | digitsQuantity |
        digitsQuantity := 0.
        aString do: [:char |
            (char isDigit) ifTrue: [digitsQuantity := digitsQuantity + 1].
        ].
        ^ digitsQuantity
]

{ #category : 'as yet unclassified' }
TextProcessing class >> findLongestWord: aString [ 
        | words maxWord |
        words := aString substrings.
        maxWord := ''.
        words do: [:word |
            (word size > maxWord size) ifTrue: [maxWord := word].
        ].
        ^ maxWord.
]

{ #category : 'as yet unclassified' }
TextProcessing class >> formattedPrint: aString number: number base: base [ 
        | formattedNumber |
        formattedNumber := base = 2 ifTrue: [number printStringBase: 2]
                          ifFalse: [base = 16 ifTrue: [number printStringBase: 16] ifFalse: [number asString]].
        ^ aString , formattedNumber
]

{ #category : 'as yet unclassified' }
TextProcessing class >> recognizeInteger: aString [
    | sign result |
    result := 0.
    sign := aString first = $- 
                ifTrue: [ -1 ] 
                ifFalse: [ 1 ].

    aString doWithIndex: [ :char :i |
        char isDigit
            ifTrue: [ result := result * 10 + char digitValue ] ].
    
    ^ result * sign

]

{ #category : 'as yet unclassified' }
TextProcessing class >> replace: aString character: oldChar with: newChars [ 
    | result |
    result := WriteStream on: String new.
    aString do: [:char |
        char = oldChar
            ifTrue: [result nextPutAll: newChars]
            ifFalse: [result nextPut: char].
    ].
    ^ result contents
]

{ #category : 'as yet unclassified' }
TextProcessing class >> sumOfIntegersInString: aString [
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
        | words |
        words := aString substrings.
        ^ words size
]
