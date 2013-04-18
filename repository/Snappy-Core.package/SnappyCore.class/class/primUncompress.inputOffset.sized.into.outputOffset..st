actions-primitive
primUncompress: inputBytes inputOffset: fromIndex sized: inputSize into: resultBytes outputOffset: outputOffset
	<primitive: 'primitiveRawUncompress' module: 'SnappyPlugin'>
	
	self primitiveFailed