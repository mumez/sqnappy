tests
testMaxCompressedLength
	"self debug: #testMaxCompressedLength"
	
	| data0 data1 |
	data0 := self shortData0.
	self assert: ((SnappyCore maxCompressedLengthOf: data0 size) =  32).
	
	data1 := self shortData1.
	self assert: ((SnappyCore maxCompressedLengthOf: data1 size) =  67).
	
	self assert: ((SnappyCore maxCompressedLengthOf: 1073741823) =  1252698825).
	
	self assert: ((SnappyCore maxCompressedLengthOf: 2147483648) =   2505397621).