actions
repeatWrite: aBlock until: booleanBlock onFinished: finishedBlock 
	[aBlock value: self.
	booleanBlock value] whileFalse.
	^ finishedBlock value: self