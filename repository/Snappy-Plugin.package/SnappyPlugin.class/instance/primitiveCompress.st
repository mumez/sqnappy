primitives
primitiveCompress
	<export: true>
	<var: 'input' type: 'const char*'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'compressed' declareC: 'char* compressed'>
	| inputObj input inputLength compressedLength compressed status |
	interpreterProxy methodArgumentCount = 1 
		ifFalse:[^interpreterProxy primitiveFail].
	inputObj := interpreterProxy stackValue: 0.
	input := self charPointerFor: inputObj.
	input ifNil: [^interpreterProxy primitiveFail].
	inputLength := interpreterProxy byteSizeOf: inputObj.
	self touch: compressedLength.
	compressedLength := self cCode: 'snappy_max_compressed_length(inputLength)' inSmalltalk: [inputLength. 0].
	compressedLength < 1 ifTrue: [^interpreterProxy primitiveFail].
	compressed := self malloc: compressedLength.
	compressed ifNil: [^interpreterProxy primitiveFail].
	status := self cCode: 'snappy_compress(input, inputLength, compressed, &compressedLength)' 
			inSmalltalk: [input. inputLength. compressed. compressedLength. SnStFallbackFailed].
	status = 0 ifFalse: [^ self returnErrorInfoFor: status].
	interpreterProxy pop: interpreterProxy methodArgumentCount+1.
	interpreterProxy push: (self oopFromCBytes: compressed sized: compressedLength).
	self free: compressed