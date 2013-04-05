actions-primitive
primUncompress: inputBytes inputOffset: fromIndex into: resultBytes outputOffset: outputOffset
	<primitive: 'primitiveRawUncompress' module: 'SnappyPlugin'>
	
	self primitiveFailed