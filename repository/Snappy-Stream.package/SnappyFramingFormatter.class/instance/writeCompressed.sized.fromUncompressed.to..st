writing
writeCompressed: compressedBytes sized: compressedSize fromUncompressed: uncompressedBytes to: aStream
	aStream nextPut: self compressedChunkType.
	self writeChunkSize: compressedSize to: aStream.
	self writeChecksumOn: uncompressedBytes to: aStream.
	aStream next: compressedSize putAll: compressedBytes startingAt: 1