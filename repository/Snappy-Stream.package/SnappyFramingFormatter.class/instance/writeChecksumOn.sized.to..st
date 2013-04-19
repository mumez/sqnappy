private-writing
writeChecksumOn: uncompressedBytes sized: originalSize to: aStream
	| crc32 |
	crc32 := self maskedCrc32cOf: uncompressedBytes sized: originalSize.
	aStream nextLittleEndianNumber: 4 put: crc32