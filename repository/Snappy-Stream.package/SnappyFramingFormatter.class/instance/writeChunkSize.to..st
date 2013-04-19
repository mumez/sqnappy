private-writing
writeChunkSize: size to: aStream
	self writeUint24: size + self checksumSize to: aStream "add CheckSum size"
	