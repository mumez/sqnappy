initialize-release
prepareBuffer
	bufferPosition := 0.
	uncompressedBuffer := ByteArray new: self blockSize.
	
	