private
stackBytesValue: index
	<returnTypeC: 'void *'>
	<var: 'dstPtr' type: 'char*'>
	<var: 'srcPtr' type: 'char*'>
	| obj sz dstPtr srcPtr |
	obj := interpreterProxy stackValue: index.
	(interpreterProxy isBytes: obj) ifFalse:[
		interpreterProxy primitiveFail.
		^nil].
	sz := interpreterProxy byteSizeOf: obj.
	dstPtr := self malloc: sz.
	dstPtr ifNil: [interpreterProxy primitiveFail.
		^nil].
	srcPtr := interpreterProxy firstIndexableField: obj.
	0 to: sz do:[:i| dstPtr at: i put: (srcPtr at: i)].
	^dstPtr