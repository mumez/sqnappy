instance creation
compressedSized: byteSize checksum: checksum on: aReadStream
	| inst |
	inst := self new.
	inst type: SnappyFramingFormatter compressedChunkType.
	inst originalSize: byteSize.
	inst checksum: checksum.
	inst sourceStream: aReadStream.
	^inst