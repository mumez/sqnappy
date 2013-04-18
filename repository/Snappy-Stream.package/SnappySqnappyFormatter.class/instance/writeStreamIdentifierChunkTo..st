writing
writeStreamIdentifierChunkTo: aStream
	super writeStreamIdentifierChunkTo: aStream. 
	aStream nextPutAll: self metaInfo