primitives
primitiveCompressWithOffset
	<export: true>
	<var: 'input' type: 'const char*'>
	<var: 'inputOffset' type: 'size_t'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'compressed' declareC: 'char* compressed'>
	| inputObj input inputOffset inputLength compressedLength compressed status |
	interpreterProxy methodArgumentCount = 2 
		ifFalse:[^interpreterProxy primitiveFail].
	inputObj := interpreterProxy stackValue: 1.
	input := self charPointerFor: inputObj.
	input ifNil: [^interpreterProxy primitiveFail].
	inputOffset := self stackPositiveIntegerValue: 0.
	inputLength := interpreterProxy byteSizeOf: (interpreterProxy stackValue: 1).
	self touch: compressedLength.
	compressedLength := self cCode: 'snappy_max_compressed_length(inputLength)' inSmalltalk: [inputLength. 0].
	compressedLength < 1 ifTrue: [^interpreterProxy primitiveFail].
	compressed := self malloc: compressedLength.
	compressed ifNil: [^interpreterProxy primitiveFail].
	status := self cCode: 'snappy_compress(input + inputOffset, inputLength, compressed, &compressedLength)' 
			inSmalltalk: [input. inputOffset. inputLength. compressed.. compressedLength. SnStFallbackFailed].
	status = 0 ifFalse: [^ self returnErrorInfoFor: status].
	interpreterProxy pop: interpreterProxy methodArgumentCount+1.
	interpreterProxy push: (self oopFromCBytes: compressed sized: compressedLength).
	self free: compressed