actions
nextPut: aByte
	self shouldFlush ifTrue: [self flush].
	self uncompressedBuffer byteAt: (self incrementBufferPosition) put: aByte