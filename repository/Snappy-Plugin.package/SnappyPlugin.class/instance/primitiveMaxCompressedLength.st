primitives
primitiveMaxCompressedLength
	<export: true>
	<var: 'sourceLength' type: 'size_t'>
	<var: 'destLength' type: 'size_t'>
	| sourceLength destLength |
	interpreterProxy methodArgumentCount = 1 
		ifFalse:[^interpreterProxy primitiveFail].
	sourceLength := self stackPositiveIntegerValue: 0.
	destLength := self cCode: 'snappy_max_compressed_length(sourceLength)' inSmalltalk: [sourceLength. SnStFallbackFailed].
	destLength < 1 ifTrue: [^interpreterProxy primitiveFail].
	self returnIntegerFor: destLength