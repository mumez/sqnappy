actions
nextPut: aByte
	self shouldFlush ifTrue: [self flash].
	self uncompressedBuffer byteAt: (self incrementBufferPosition) put: aByte