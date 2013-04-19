actions-helper
maskedCrc32cOf: buffer sized: bufferSize
	(buffer isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	(bufferSize < 0) ifTrue: [self signalInvalidInput].
	^ self primMaskedCrc32cOf: buffer sized: bufferSize