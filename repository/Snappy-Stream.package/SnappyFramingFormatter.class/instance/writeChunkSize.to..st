private-writing
writeChunkSize: size to: aStream
	self writeUint24: size + self checksumSize to: stream "add CheckSum size"
	