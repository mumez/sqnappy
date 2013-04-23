actions
next
	| chunk |
	chunk := self readLimit = 0
				ifTrue: [self nextChunk]
				ifFalse: [self lastChunk].
	chunk currentIndex >= chunk uncompressedSize
		ifTrue: [chunk := self nextChunk incrementCurrentIndex]
		ifFalse: [chunk incrementCurrentIndex].
	^ self contentStream originalContents byteAt: chunk currentIndex + self paddingIndex