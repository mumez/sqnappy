actions
uncompress: bytes
	(bytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	^self primUncompress: bytes