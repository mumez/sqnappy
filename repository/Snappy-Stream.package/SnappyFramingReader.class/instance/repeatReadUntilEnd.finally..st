actions
repeatReadUntilEnd: aBlock finally: finishedBlock 
	[[self atEnd]
		whileFalse: [self nextChunkProcessed.
			aBlock value: self]]
		ensure: [finishedBlock value: self]