reading
readCompressedChunkFrom: aStream
	| chunkSize checksum  byteSize |
	chunkSize := self readByteSizeFrom: aStream.
	checksum := self readChecksumFrom: aStream.
	byteSize := chunkSize - self checksumSize.
	^ SnappyFramingChunk compressedSized: byteSize checksum: checksum on: aStream