tests
testUncompress
	"self debug: #testUncompress"
	
	| data0 data1 |
	data0 := self shortCompressed0.
	self assert: ((SnappyCore uncompress: data0) = self shortData0).
	
	data1 := self shortCompressed1.
	self assert: ((SnappyCore uncompress: data1) = self shortData1).