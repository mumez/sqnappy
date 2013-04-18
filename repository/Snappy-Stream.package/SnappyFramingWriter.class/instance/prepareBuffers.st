initialize-release
prepareBuffers
	| cBufSize |
	bufferPosition := 0.
	uncompressedBuffer := ByteArray new: self blockSize.
	cBufSize := self snappyCore maxCompressedLengthOf: self blockSize.
	compressedBuffer := ByteArray new: cBufSize.
	
	