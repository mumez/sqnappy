accessing
contentStream
	^ contentStream ifNil: [contentStream := WriteStream on: (ByteArray new: self blockSize)]