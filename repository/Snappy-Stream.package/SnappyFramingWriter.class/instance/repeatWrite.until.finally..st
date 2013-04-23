actions
repeatWrite: aBlock until: booleanBlock finally: finishedBlock 
	^ [[aBlock value: self.
	booleanBlock value] whileFalse]
		ensure: [finishedBlock value: self]