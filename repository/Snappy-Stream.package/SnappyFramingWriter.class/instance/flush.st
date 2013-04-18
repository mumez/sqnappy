private
flush
	bufferPosition = 0 ifTrue: [^ self].
	self writeDataChunk.
	bufferPosition := 0