actions
next
	| chunk |
	chunk := self basicNext.
	^self contentStream originalContents byteAt: chunk currentIndex + self paddingIndex.
	
	