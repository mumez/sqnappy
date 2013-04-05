private
oopFromCBytes: cBytes sized: bytesSize
	<var: 'cBytes' type: 'char*'>
	<var: 'dstPtr' type: 'char*'>
	| sz result dstPtr |
	cBytes == nil ifTrue:[^interpreterProxy nilObject].
	sz := bytesSize.
	result := interpreterProxy instantiateClass: interpreterProxy classByteArray indexableSize: sz.
	interpreterProxy pushRemappableOop: result.
	dstPtr := interpreterProxy firstIndexableField: result.
	0 to: sz-1 do:[:i| dstPtr at: i put: (cBytes at: i)].
	^interpreterProxy popRemappableOop