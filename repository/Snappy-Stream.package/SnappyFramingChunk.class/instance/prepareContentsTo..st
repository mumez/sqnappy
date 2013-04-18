actions
prepareContentsTo: destStream 
	self startIndex: destStream position + 1.
	self type caseOf: {
		[SnappyFramingFormatter compressedChunkType]->[self writeExtractUncompressedBytesOn: destStream].
		[SnappyFramingFormatter uncompressedChunkType]->[self writeUncompressedBytesOn: destStream].
	}.
	self endIndex: destStream position.
	self readEndIndex: self sourceStream position