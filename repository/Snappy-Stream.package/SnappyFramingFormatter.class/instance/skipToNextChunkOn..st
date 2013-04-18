reading
skipToNextChunkOn: aStream
	| sz |
	sz := self readByteSizeFrom: aStream.
	aStream skip: sz.
	^nil