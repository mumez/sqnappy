initialize-release
on: aByteArrayOrStream
	paddingIndex := 0.
	chunks := OrderedCollection new.
	self prepareBuffer.
	stream := aByteArrayOrStream isStream
				ifTrue: [aByteArrayOrStream]
				ifFalse: [ReadStream on: aByteArrayOrStream].
	self formatter readChunkTyped: stream next on: stream 