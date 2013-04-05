primitives
primitiveRawValidateCompressedBuffer
	<export: true>
	<var: 'compressed' type: 'const char*'>
	<var: 'offset' type: 'size_t'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'status' declareC: 'snappy_status status'>
	| compressedObj compressed offset compressedLength status |
	interpreterProxy methodArgumentCount = 2 
		ifFalse:[^interpreterProxy primitiveFail].
	compressedObj := interpreterProxy stackValue: 1.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	offset := self stackPositiveIntegerValue: 0.
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	status := self cCode: 'snappy_validate_compressed_buffer(compressed + offset, compressedLength)' inSmalltalk: [compressed. offset. compressedLength. SnInvalidInput].
	interpreterProxy pop: (interpreterProxy methodArgumentCount+1).
	interpreterProxy pushInteger: status