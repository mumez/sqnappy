actions
uncompressedLengthOf: compressedBytes
	| ret |
	(compressedBytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	ret := self primUncompressedLengthOf: compressedBytes.
	ret < 0 ifTrue: [self signalFromStatusCode: ret].
	^ret