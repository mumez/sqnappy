private-reading
readByteSizeOf: bsType on: aStream 
	^ bsType caseOf: {
		[0]->[self readUint16From: aStream].
		[1]->[self readUint16From: aStream]
	} otherwise: [self readUint24From: aStream]