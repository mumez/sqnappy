actions-primitive
primCompress: inputBytes inputOffset: fromIndex sized: inputSize into: resultBytes outputOffset: outputOffset
	<primitive: 'primitiveRawCompress' module: 'SnappyPlugin'>
	
	self primitiveFailed