reading
readBlockSizeTypeFrom: aStream
	| szType |
	szType := aStream next.
	szType ifNil: [SnappyFramingError signalWithReason: #BlockSizeTypeEmpty].
	szType := szType bitAnd: 2r111.
	self blockSizeType: szType.
	self blockSize: self computeBlockSize.