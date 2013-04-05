actions
maxCompressedLengthOf: sourceSize
	sourceSize isInteger ifFalse: [self signalInvalidInput].
	sourceSize < 0 ifTrue: [self signalInvalidInput].
	^self primMaxCompressedLengthOf: sourceSize