actions
contents
	[self atEnd] whileFalse: [
		self nextChunk contentProcessed
	].
	^self contentStream contents