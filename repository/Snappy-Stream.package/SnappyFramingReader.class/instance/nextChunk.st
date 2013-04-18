actions
nextChunk
	| type chunk |
	type := self stream next.
	chunk := self formatter readChunkTyped: type on: stream.
	chunk ifNotNil: [
		chunk prepareContentsFor: self.
		self refreshPaddingIndex.
		self chunks add: chunk.
	].
	^chunk