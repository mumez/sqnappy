actions
nextPutAll: aByteArray
	| readByteCount source writeByteSize |
	source := aByteArray.
	readByteCount := 0.
	writeByteSize := aByteArray size.
	[readByteCount < writeByteSize] whileTrue: [| copiedSize |
		copiedSize := (self uncompressedBuffer size - self bufferPosition) min: (writeByteSize - readByteCount).
		self snappyCore copyBytes: source inputOffset: readByteCount sized: copiedSize into: self uncompressedBuffer outputOffset: self bufferPosition.
		readByteCount := readByteCount + copiedSize.
		self bufferPosition: (self bufferPosition + copiedSize).
		self shouldFlush ifTrue: [self flush]
	]