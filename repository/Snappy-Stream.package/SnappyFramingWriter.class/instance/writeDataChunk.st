private
writeDataChunk
	| compressedBuf compressedSize uncompressedBuf |
	compressedBuf := self compressedBuffer.
	uncompressedBuf := self uncompressedBuffer.
	compressedSize := self snappyCore compress: uncompressedBuf inputOffset: 0 sized: self bufferPosition into: compressedBuf outputOffset: 0.
	compressedSize < self bufferPosition
		ifTrue: [self formatter writeCompressed: compressedBuf sized: compressedSize fromUncompressed: uncompressedBuf to: self stream]
		ifFalse: [self formatter writeUncompressed: uncompressedBuf sized: self bufferPosition to: self stream].
	