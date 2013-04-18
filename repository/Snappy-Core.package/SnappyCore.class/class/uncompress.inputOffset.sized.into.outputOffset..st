actions-raw
uncompress: inputBytes inputOffset: fromIndex sized: inputSize into: resultBytes outputOffset: outputOffset
	(inputBytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	(resultBytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	^self primUncompress: inputBytes inputOffset: fromIndex sized: inputSize into: resultBytes outputOffset: outputOffset