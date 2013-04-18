private-writing
writeChecksumOn: uncompresseBytes to: aStream
	| chechSum crc32 |
	crc32 := self crc32Of: uncompresseBytes.
	chechSum := self maskedChechsumFrom: crc32.
	aStream stream nextLittleEndianNumber: 4 put: chechSum