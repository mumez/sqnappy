actions
reset
	contentStream := nil.
	stream ifNotNil: [stream reset].
	self on: stream