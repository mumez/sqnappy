primitives
primitiveUncompress
	<export: true>
	<var: 'compressed' type: 'const char*'>
	<var: 'compressedLength' declareC: 'size_t compressedLength'>
	<var: 'status' declareC: 'snappy_status status'>
	<var: 'uncompressed' declareC: 'char* uncompressed'>
	<var: 'uncompressedLength' declareC: 'size_t uncompressedLength'>
	| compressedObj compressed compressedLength status uncompressed uncompressedLength |
	interpreterProxy methodArgumentCount = 1 
		ifFalse:[^interpreterProxy primitiveFail].
	compressedObj := interpreterProxy stackValue: 0.
	compressed := self charPointerFor: compressedObj.
	compressed ifNil: [^interpreterProxy primitiveFail].
	compressedLength := interpreterProxy byteSizeOf: compressedObj.
	status := self cCode: 'snappy_uncompressed_length(compressed, compressedLength, &uncompressedLength)' inSmalltalk: [compressed.  compressedLength. uncompressedLength. SnStFallbackFailed].
	status = 0 ifFalse: [^interpreterProxy primitiveFailFor: status].
	uncompressed := self malloc: uncompressedLength.
	status := self cCode: 'snappy_uncompress(compressed, compressedLength, uncompressed, &uncompressedLength)' 
			inSmalltalk: [compressed. compressedLength. uncompressed. uncompressedLength. -1].
	status = 0 ifFalse: [^ self returnErrorInfoFor: status].
	interpreterProxy pop: interpreterProxy methodArgumentCount+1.
	interpreterProxy push: (self oopFromCBytes: uncompressed sized: uncompressedLength).
	self free: uncompressed