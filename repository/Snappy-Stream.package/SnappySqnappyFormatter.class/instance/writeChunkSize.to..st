private-writing
writeChunkSize: size to: aStream
	self blockSizeType caseOf: {
		[0]->[self writeUint16: size to: aStream].
		[1]->[self writeUint16: size to: aStream]
	} otherwise: [self writeUint24: size to: aStream]