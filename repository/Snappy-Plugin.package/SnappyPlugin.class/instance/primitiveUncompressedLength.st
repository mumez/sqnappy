primitives
primitiveUncompressedLength
	<export: true>
	<var: 'compressed' type: 'const char*'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'status' declareC: 'snappy_status status'>
	<var: 'result' declareC: 'size_t result'>
	| compressedObj compressed compressedLength result status |
	interpreterProxy methodArgumentCount = 1 
		ifFalse:[^interpreterProxy primitiveFail].
	compressedObj := interpreterProxy stackValue: 0.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	status := self cCode: 'snappy_uncompressed_length(compressed, compressedLength, &result)' inSmalltalk: [compressed. compressedLength. result. SnStFallbackFailed].
	status = SnOK ifTrue: [^ self returnIntegerFor: result].
	self returnErrorInfoFor: status.
	