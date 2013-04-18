actions-raw
compress: inputBytes inputOffset: fromIndex sized: inputSize into: resultBytes outputOffset: outputOffset
	(inputBytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	(resultBytes isKindOf: ByteArray) ifFalse: [self signalInvalidInput].
	^self primCompress: inputBytes inputOffset: fromIndex sized: inputSize into: resultBytes outputOffset: outputOffset