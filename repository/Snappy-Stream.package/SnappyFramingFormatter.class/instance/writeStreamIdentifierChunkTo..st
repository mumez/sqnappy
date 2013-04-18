writing
writeStreamIdentifierChunkTo: aStream
	aStream nextPut: StreamIdentifierChunkType.
	aStream nextPutAll: self streamIdentifier