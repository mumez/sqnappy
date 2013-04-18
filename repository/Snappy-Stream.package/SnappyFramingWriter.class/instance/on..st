initialize-release
on: aByteArrayOrStream 
	self prepareBuffers.
	stream := aByteArrayOrStream isStream
				ifTrue: [aByteArrayOrStream]
				ifFalse: [WriteStream on: aByteArrayOrStream].
	self formatter writeStreamIdentifierChunkTo: stream