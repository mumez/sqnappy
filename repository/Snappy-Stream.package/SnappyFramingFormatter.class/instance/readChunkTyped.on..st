reading
readChunkTyped: chunkType on: aStream 
	^ chunkType caseOf: {
		[StreamIdentifierChunkType]->[self readStreamIdentifierChunkFrom: aStream].
		[CompressedChunkType]->[self readCompressedChunkFrom: aStream].
		[UncompressedChunkType]->[self readUncompressedChunkFrom: aStream]
	} otherwise: [
		chunkType ifNil: [SnappyFramingError signalWithReason: #EndOfStream].
		(chunkType between: 2 and: 127) 
			ifTrue: [SnappyFramingError signalWithReason: #ReservedUnskippableChunk]
			ifFalse: [self skipToNextChunkOn: aStream]
	]