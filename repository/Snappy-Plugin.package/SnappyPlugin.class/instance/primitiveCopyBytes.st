primitives
primitiveCopyBytes
	<export: true>
	<var: 'input' type: 'const char*'>
	<var: 'inputOffset' type: 'size_t'>
	<var: 'inputLength' declareC: 'size_t inputLength'>
	<var: 'output' type: 'char*'>
	<var: 'outputOffset' type: 'size_t'>
	<var: 'ret' declareC: 'char* ret'>
	| inputObj input inputOffset inputLength output outputOffset ret |
	interpreterProxy methodArgumentCount = 4 
		ifFalse:[^interpreterProxy primitiveFail].
	inputObj := interpreterProxy stackValue: 3.
	input := self charPointerFor: inputObj.
	input ifNil: [^interpreterProxy primitiveFail].
	inputOffset := self stackPositiveIntegerValue: 2.
	inputLength := interpreterProxy byteSizeOf: inputObj.
	output := self stackCharPointer: 1.
	outputOffset := self stackPositiveIntegerValue: 0. 
		
	ret := self cCode: 'memcpy(output + outputOffset, input + inputOffset, inputLength)' inSmalltalk: [input. inputOffset. inputLength. output. outputOffset. 0].
	ret = 0 ifTrue: [^interpreterProxy primitiveFail].
	
	interpreterProxy pop: interpreterProxy methodArgumentCount+1.
	interpreterProxy push: (self oopFromCBytes: ret sized: inputLength)