actions
repeatReadUntilEnd: aBlock out: aWriteStream onFinished: finishedBlock 
	self outStream: aWriteStream.
	^ self repeatReadUntilEnd: aBlock onFinished: finishedBlock 