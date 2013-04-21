accessing
outStream: aWriteStream
	aWriteStream ifNil: [^contentStream := nil].
	contentStream := aWriteStream binary