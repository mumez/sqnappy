initialize-release
with: aByteArray
	self prepareBuffers.
	stream := WriteStream with: aByteArray.
	self formatter writeStreamIdentifierChunkTo: stream