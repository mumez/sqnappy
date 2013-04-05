private
stackPositiveIntegerValue: index
	| num |
	num := (interpreterProxy stackValue: 0).
	((interpreterProxy isIntegerValue: num) and: [num < 0]) ifTrue: [^nil].
	 ^ interpreterProxy positive32BitValueOf: num
	