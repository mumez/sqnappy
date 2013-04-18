testing
atEnd

	^self stream atEnd and: [self lastChunk currentIndex >= self lastChunk uncompressedSize]