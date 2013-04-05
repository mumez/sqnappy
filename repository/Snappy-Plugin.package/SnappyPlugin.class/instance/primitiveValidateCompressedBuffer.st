primitives
primitiveValidateCompressedBuffer
	<export: true>
	<var: 'compressed' type: 'const char*'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'status' declareC: 'snappy_status status'>
	| compressedObj compressed compressedLength status |
	interpreterProxy methodArgumentCount = 1 
		ifFalse:[^interpreterProxy primitiveFail].
	compressedObj := interpreterProxy stackValue: 0.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	status := self cCode: 'snappy_validate_compressed_buffer(compressed, compressedLength)' inSmalltalk: [compressed. compressedLength. SnInvalidInput].
	interpreterProxy pop: (interpreterProxy methodArgumentCount+1).
	interpreterProxy pushInteger: status