actions
repeatReadUntilEnd: aBlock out: aWriteStream finally: finishedBlock 
	self outStream: aWriteStream.
	^ self repeatReadUntilEnd: aBlock finally: finishedBlock 