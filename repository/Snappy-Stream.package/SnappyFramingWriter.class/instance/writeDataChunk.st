private
writeDataChunk
	| compressedBuf uncompressedBuf compressedSize originalSize |
	compressedBuf := self compressedBuffer.
	uncompressedBuf := self uncompressedBuffer.
	originalSize := self bufferPosition.
	compressedSize := self snappyCore compress: uncompressedBuf inputOffset: 0 sized: originalSize into: compressedBuf outputOffset: 0.
	compressedSize < (originalSize - (originalSize bitShift: -3))
		ifTrue: [self formatter writeCompressed: compressedBuf sized: compressedSize fromUncompressed: uncompressedBuf sized: originalSize to: self stream]
		ifFalse: [self formatter writeUncompressed: uncompressedBuf sized: originalSize to: self stream].
	