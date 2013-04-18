reading
readByteSizeFrom: aStream 
	^ self readByteSizeOf: self blockSizeType on: aStream 