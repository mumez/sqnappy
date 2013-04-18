accessing
byteAt: pos
	| byte origPosition |
	origPosition := self destinationStream position.
	self destinationStream position: self startIndex.
	self destinationStream skip: (pos -1).
	byte := self destinationStream next.
	self destinationStream position: origPosition.
	^byte