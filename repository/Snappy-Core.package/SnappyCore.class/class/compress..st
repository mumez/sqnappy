actions
compress: bytes
	(bytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	^self primCompress: bytes