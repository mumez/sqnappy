instance creation
identifierSized: byteSize on: aReadStream
	| inst |
	inst := self new.
	inst type: SnappyFramingFormatter streamIdentifierChunkType.
	inst originalSize: byteSize.
	inst sourceStream: aReadStream.
	^inst