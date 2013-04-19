primitives
primitiveMaskedCrc32c
	<export: true>
	<var: 'buf' type: 'const char*'>
	<var: 'len' type: 'size_t'>
	<var: 'maskedCrc' declareC: 'unsigned int maskedCrc'>
	| inputObj buf len maskedCrc |
	interpreterProxy methodArgumentCount = 2 
		ifFalse:[^interpreterProxy primitiveFail].
	inputObj := interpreterProxy stackValue: 1.
	buf := self charPointerFor: inputObj.
	buf ifNil: [^interpreterProxy primitiveFail].
	len :=  self stackPositiveIntegerValue: 0.
	len  ifNil: [^interpreterProxy primitiveFail].
	maskedCrc := self cCode: 'masked_crc32c(buf, len)' inSmalltalk: [buf. len. 0].
	self returnIntegerFor: maskedCrc