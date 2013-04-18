accessing
readLimit
	self chunks ifEmpty: [^0].
	^ self chunks last readEndIndex