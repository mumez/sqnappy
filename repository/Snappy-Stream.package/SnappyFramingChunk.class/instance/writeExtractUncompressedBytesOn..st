private
writeExtractUncompressedBytesOn: aWriteStream
	| compressedBytes uncompressedBuf bufSize uncompressedSize |
	compressedBytes := self sourceStream next: self originalSize.
	bufSize := self snappyCore uncompressedLengthOf: compressedBytes.
	uncompressedBuf := self prepareUncompressedBufferFor: bufSize.
	uncompressedSize := self snappyCore uncompress: compressedBytes inputOffset: 0 sized: compressedBytes size into: uncompressedBuf outputOffset: 0.
	(self hasValidChecksumFor: uncompressedBuf sized: uncompressedSize) 
		ifFalse: [SnappyFramingError signalWithReason: #InvalidChecksum].
	aWriteStream next: uncompressedSize putAll: uncompressedBuf startingAt: 1
	