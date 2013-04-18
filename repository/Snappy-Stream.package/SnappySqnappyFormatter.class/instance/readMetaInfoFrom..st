reading
readMetaInfoFrom: aStream
	self readVersionFrom: aStream.
	self readBlockSizeTypeFrom: aStream
	