private
basicNext
	| chunk |
	chunk := self readLimit = 0 ifTrue: [self nextChunk] ifFalse: [self lastChunk].
	chunk incrementCurrentIndex.
	chunk currentIndex > chunk uncompressedSize ifTrue: [
		chunk := self nextChunk incrementCurrentIndex.
	].
	^chunk
	