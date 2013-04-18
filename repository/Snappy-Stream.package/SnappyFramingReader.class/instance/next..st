actions
next: anInteger
	| ans |
	ans := WriteStream on: (ByteArray new: anInteger).
	anInteger timesRepeat: [ans nextPut: self next].
	^ans contents
	