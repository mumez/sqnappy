tests
testUncompressedLength
	"self debug: #testUncompressedLength"
	
	
	self assert: ((SnappyCore uncompressedLengthOf: self shortCompressed0) = self shortData0 size).
	
	self assert: ((SnappyCore uncompressedLengthOf: self shortCompressed1) = self shortData1 size).