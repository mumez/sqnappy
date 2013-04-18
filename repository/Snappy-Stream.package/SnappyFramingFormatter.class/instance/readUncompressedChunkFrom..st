reading
readUncompressedChunkFrom: aStream
	| chunkSize checksum  byteSize |
	chunkSize := self readByteSizeFrom: aStream.
	checksum := self readChecksumFrom: aStream.
	byteSize := chunkSize - self checksumSize.
	^ SnappyFramingChunk uncompressedSized: byteSize checksum: checksum on: aStream