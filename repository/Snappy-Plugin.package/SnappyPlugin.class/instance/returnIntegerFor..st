private
returnIntegerFor: cInteger 
	interpreterProxy pop: interpreterProxy methodArgumentCount + 1.
	cInteger <= 1073741823 "SmallInteger maxVal"
		ifTrue: [interpreterProxy pushInteger: cInteger]
		ifFalse: [interpreterProxy push: (interpreterProxy positive32BitIntegerFor: cInteger)]