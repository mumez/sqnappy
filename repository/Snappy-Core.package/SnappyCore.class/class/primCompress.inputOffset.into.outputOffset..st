actions-primitive
primCompress: inputBytes inputOffset: fromIndex into: resultBytes outputOffset: outputOffset
	<primitive: 'primitiveRawCompress' module: 'SnappyPlugin'>
	
	self primitiveFailed