writing
writeCompressed: compressedBytes sized: compressedSize fromUncompressed: uncompressedBytes sized: originalSize to: aStream
	aStream nextPut: self compressedChunkType.
	self writeChunkSize: compressedSize to: aStream.
	self writeChecksumOn: uncompressedBytes sized: originalSize to: aStream.
	aStream next: compressedSize putAll: compressedBytes startingAt: 1