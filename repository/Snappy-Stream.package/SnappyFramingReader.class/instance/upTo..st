actions
upTo: anObject 
	| newStream element |
	newStream := WriteStream on: (ByteArray new: 1024).
	[self atEnd or: [(element := self next) = anObject]]
		whileFalse: [newStream nextPut: element].
	^newStream contents