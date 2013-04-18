private
shouldFlush
	^ self bufferPosition + self checksumSize >= self blockSize