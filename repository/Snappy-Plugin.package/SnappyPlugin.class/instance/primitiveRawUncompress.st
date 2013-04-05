primitives
primitiveRawUncompress
	<export: true>
	<var: 'compressed' type: 'const char*'>
	<var: 'inputOffset' type: 'size_t'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'uncompressed' type: 'char*'>
	<var: 'outputOffset' type: 'size_t'>
	<var: 'uncompressedLength' declareC: 'size_t uncompressedLength'>
	<var: 'status' declareC: 'snappy_status status'>
	| compressedObj compressed inputOffset compressedLength uncompressedObj uncompressed outputOffset uncompressedLength status |
	interpreterProxy methodArgumentCount = 4 
		ifFalse:[^interpreterProxy primitiveFail].	
	compressedObj := interpreterProxy stackValue: 3.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	inputOffset := self stackPositiveIntegerValue: 2.
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	uncompressedObj := interpreterProxy stackValue: 1.
	uncompressed := self charPointerFor: uncompressedObj.
	uncompressed ifNil: [^interpreterProxy primitiveFail].
	outputOffset :=  self stackPositiveIntegerValue: 0. 
	uncompressedLength := interpreterProxy byteSizeOf: uncompressedObj.
	status := self cCode: 'snappy_uncompress(compressed + inputOffset, compressedLength, uncompressed + outputOffset, &uncompressedLength)' 
			inSmalltalk: [compressed. inputOffset. compressedLength. uncompressed. outputOffset. uncompressedLength. SnStFallbackFailed].
	status = 0 ifFalse: [^ self returnErrorInfoFor: status].
	self returnIntegerFor: uncompressedLength