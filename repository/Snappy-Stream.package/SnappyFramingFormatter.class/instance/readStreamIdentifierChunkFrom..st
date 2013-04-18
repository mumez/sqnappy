reading
readStreamIdentifierChunkFrom: aStream
	| sz identifier |
	sz := self streamIdentifier size.
	identifier := aStream next: sz.
	identifier = self streamIdentifier ifFalse: [SnappyFramingError signalWithReason: #BadStreamIdentifier].
	^SnappyFramingChunk identifierSized: sz on: aStream