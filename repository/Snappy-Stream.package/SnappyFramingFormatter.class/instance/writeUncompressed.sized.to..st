writing
writeUncompressed: uncompressedBytes sized: originalSize to: aStream
	aStream nextPut: self uncompressedChunkType.
	self writeChunkSize: originalSize to: aStream.
	self writeChecksumOn: uncompressedBytes sized: originalSize to: aStream.
	aStream next: originalSize putAll: uncompressedBytes startingAt: 1