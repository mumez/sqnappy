initialize-release
on: aByteArrayOrStream 
	self prepareBuffers.
	stream := aByteArrayOrStream isStream
				ifTrue: [aByteArrayOrStream]
				ifFalse: [WriteStream on: aByteArrayOrStream].
	stream binary.
	self formatter writeStreamIdentifierChunkTo: stream