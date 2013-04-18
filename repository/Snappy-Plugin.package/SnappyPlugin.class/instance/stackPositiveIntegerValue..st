private
stackPositiveIntegerValue: index
	| num |
	num := (interpreterProxy stackValue: index).
	((interpreterProxy isIntegerValue: num) and: [num < 0]) ifTrue: [^nil].
	 ^ interpreterProxy positive32BitValueOf: num
	