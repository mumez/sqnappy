tests
testCompress
	"self debug: #testCompress"
	
	| data0 data1 |
	data0 := self shortData0.
	self assert: ((SnappyCore compress: data0) = self shortCompressed0).
	
	data1 := self shortData1.
	self assert: ((SnappyCore compress: data1) = self shortCompressed1).