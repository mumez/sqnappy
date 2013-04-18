actions
contents
	self flush.
	^self stream ifNotNil: [:str | str contents]