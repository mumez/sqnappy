reading
readStreamIdentifierChunkFrom: aStream
	| chunk |
	chunk := super readStreamIdentifierChunkFrom: aStream.
	self readMetaInfoFrom: aStream.
	^SnappyFramingChunk identifierSized: chunk originalSize + 2 "Meta info" on: aStream