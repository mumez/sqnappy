instance creation
uncompressedSized: byteSize checksum: checksum on: aReadStream
	| inst |
	inst := self new.
	inst type: SnappyFramingFormatter uncompressedChunkType.
	inst originalSize: byteSize.
	inst checksum: checksum.
	inst sourceStream: aReadStream.
	^inst