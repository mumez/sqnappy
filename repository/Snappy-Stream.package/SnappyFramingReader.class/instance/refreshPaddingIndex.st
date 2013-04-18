private
refreshPaddingIndex
	self lastChunk ifNil: [^paddingIndex].
	paddingIndex := paddingIndex + self lastChunk uncompressedSize.
	^paddingIndex