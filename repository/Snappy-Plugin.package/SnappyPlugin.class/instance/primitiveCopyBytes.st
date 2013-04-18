primitives
primitiveCopyBytes
	<export: true>
	<var: 'input' type: 'const char*'>
	<var: 'inputOffset' type: 'size_t'>
	<var: 'inputLength' type: 'size_t'>
	<var: 'output' type: 'char*'>
	<var: 'outputOffset' type: 'size_t'>
	<var: 'ret' declareC: 'char* ret'>
	| inputObj input inputOffset inputLength output outputOffset ret |
	interpreterProxy methodArgumentCount = 5 
		ifFalse:[^interpreterProxy primitiveFail].
	inputObj := interpreterProxy stackValue: 4.
	input := self charPointerFor: inputObj.
	input ifNil: [^interpreterProxy primitiveFail].
	inputOffset := self stackPositiveIntegerValue: 3.
	inputLength := self stackPositiveIntegerValue: 2.
	output := self stackCharPointer: 1.
	outputOffset := self stackPositiveIntegerValue: 0. 
		
	ret := self cCode: 'memcpy(output + outputOffset, input + inputOffset, inputLength)' inSmalltalk: [input. inputOffset. inputLength. output. outputOffset. 0].
	ret = 0 ifTrue: [^interpreterProxy primitiveFail].
	
	interpreterProxy pop: interpreterProxy methodArgumentCount+1.
	interpreterProxy push: (self oopFromCBytes: ret sized: inputLength)