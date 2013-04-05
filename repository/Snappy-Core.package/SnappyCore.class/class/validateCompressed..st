actions
validateCompressed: bytes
	| ret |
	(bytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	ret := self primValidateCompressedBuffer: bytes.
	^ret = 0