private
prepareUncompressedBufferFor: desirableBufferSize
	| buf |
	buf := self uncompressedBuffer.
	buf size < desirableBufferSize ifTrue: [
		buf := buf grownBy: ((desirableBufferSize - buf size) max: 1024)
	].
	self uncompressedBuffer: buf.
	^buf