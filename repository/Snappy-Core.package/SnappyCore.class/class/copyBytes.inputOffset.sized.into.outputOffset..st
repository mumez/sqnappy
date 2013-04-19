actions-helper
copyBytes: source inputOffset: inputOffset sized: copySize into: target outputOffset: outputOffset
	(source isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	(target isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	^self primCopyBytes: source inputOffset: inputOffset sized: copySize into: target outputOffset: outputOffset