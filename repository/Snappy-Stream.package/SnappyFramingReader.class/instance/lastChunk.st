accessing
lastChunk
	self chunks ifEmpty: [^nil].
	^ self chunks last 