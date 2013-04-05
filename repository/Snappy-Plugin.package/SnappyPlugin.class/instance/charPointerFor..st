private
charPointerFor: obj
	"The stack object at 'index' should be an ExternalAddress; this function answers a pointer to the actual address (skip the object header)."
	<returnTypeC: 'char*'>
	<var: 'ptr' declareC: 'char* ptr'>
	| ptr |
	(interpreterProxy isBytes: obj) ifFalse:[^nil].
	ptr := interpreterProxy firstIndexableField: obj.
	^ptr
	