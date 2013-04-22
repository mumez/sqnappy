actions
repeatReadUntilEnd: aBlock onFinished: finishedBlock 
	[self atEnd]
		whileFalse: [self basicNext.
			aBlock value: self].
	finishedBlock value: self