actions
repeatRead: aBlock outStream: aWriteStream onFinished: finishedBlock 
	self outStream: aWriteStream.
	^ self repeatRead: aBlock onFinished: finishedBlock 