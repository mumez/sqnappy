primitives
primitiveRawUncompressedLength
	<export: true>
	<var: 'compressed' type: 'const char*'>
	<var: 'offset' type: 'size_t'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'result' declareC: 'size_t result'>
	<var: 'status' declareC: 'snappy_status status'>
	| compressedObj compressed offset compressedLength result status |
	interpreterProxy methodArgumentCount = 2 
		ifFalse:[^interpreterProxy primitiveFail].
	compressedObj := interpreterProxy stackValue: 1.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	offset := self stackPositiveIntegerValue: 0.
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	status := self cCode: 'snappy_uncompressed_length(compressed + offset, compressedLength, &result)' inSmalltalk: [compressed. offset. compressedLength. result. SnStFallbackFailed].
	status = SnOK ifTrue: [^ self returnIntegerFor: result].
	self returnErrorInfoFor: status.