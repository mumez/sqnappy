private
writeUncompressedBytesOn: aWriteStream
	| uncompressedBytes |
	uncompressedBytes := self sourceStream next: self originalSize.
	(self hasValidChecksumFor: uncompressedBytes sized: uncompressedBytes size)
		ifFalse: [SnappyFramingError signalWithReason: #InvalidChecksum].
	aWriteStream nextPutAll: uncompressedBytes