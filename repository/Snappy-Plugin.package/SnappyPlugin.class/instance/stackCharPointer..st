private
stackCharPointer: index
	"The stack object at 'index' should be an ExternalAddress; this function answers a pointer to the actual address (skip the object header)."
	| obj ptr |
	<returnTypeC: 'char*'>
	<var: 'ptr' declareC: 'char* ptr'>
	obj := interpreterProxy stackObjectValue: index.
	(interpreterProxy isBytes: obj) ifFalse:[^nil].
	ptr := self cCoerce: (interpreterProxy firstIndexableField: obj) to: 'char*'.
	^ptr
	