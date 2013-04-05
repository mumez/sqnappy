primitives
primitiveRawCompress
	<export: true>
	<var: 'input' type: 'const char*'>
	<var: 'inputOffset' type: 'size_t'>
	<var: 'inputLength' declareC: 'size_t inputLength'>
	<var: 'compressed' type: 'char*'>
	<var: 'outputOffset' type: 'size_t'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'status' declareC: 'snappy_status status'>
	| inputObj input inputOffset inputLength compressedObj compressed outputOffset compressedLength status |
	interpreterProxy methodArgumentCount = 4 
		ifFalse:[^interpreterProxy primitiveFail].
	inputObj := interpreterProxy stackValue: 3.
	input := self charPointerFor: inputObj.
	input ifNil: [^interpreterProxy primitiveFail].
	inputOffset := self stackPositiveIntegerValue: 2.
	inputLength := interpreterProxy byteSizeOf: inputObj.
	compressedObj := interpreterProxy stackValue: 1.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	outputOffset :=  self stackPositiveIntegerValue: 0. 
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	status := self cCode: 'snappy_compress(input + inputOffset, inputLength, compressed + outputOffset, &compressedLength)' 
			inSmalltalk: [input. inputOffset. inputLength. compressed. outputOffset. compressedLength. SnStFallbackFailed].
	status = 0 ifFalse: [^self returnErrorInfoFor: status].
	self returnIntegerFor: compressedLength