primitives
primitiveUncompressWithOffset
	<export: true>
	<var: 'compressed' type: 'const char*'>
	<var: 'inputOffset' type: 'size_t'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'status' declareC: 'snappy_status status'>
	<var: 'uncompressed' declareC: 'char* uncompressed'>
	<var: 'uncompressedLength' declareC: 'size_t uncompressedLength'>
	| compressedObj compressed inputOffset compressedLength status uncompressed uncompressedLength |
	interpreterProxy methodArgumentCount = 2 
		ifFalse:[^interpreterProxy primitiveFail].
	compressedObj := interpreterProxy stackValue: 1.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	inputOffset := self stackPositiveIntegerValue: 0.
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	status := self cCode: 'snappy_uncompressed_length(compressed + inputOffset, compressedLength, &uncompressedLength)' inSmalltalk: [compressed.  inputOffset. compressedLength. uncompressedLength. SnStFallbackFailed].
	status = 0 ifFalse: [^interpreterProxy primitiveFailFor: status].
	uncompressed := self malloc: uncompressedLength.
	status := self cCode: 'snappy_uncompress(compressed + inputOffset, compressedLength, uncompressed, &uncompressedLength)' 
			inSmalltalk: [compressed. inputOffset. compressedLength. uncompressed. uncompressedLength. SnStFallbackFailed].
	status = 0 ifFalse: [^ self returnErrorInfoFor: status].
	interpreterProxy pop: interpreterProxy methodArgumentCount+1.
	interpreterProxy push: (self oopFromCBytes: uncompressed sized: uncompressedLength).
	self free: uncompressed