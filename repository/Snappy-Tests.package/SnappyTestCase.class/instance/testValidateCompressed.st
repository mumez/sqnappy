tests
testValidateCompressed
	"self debug: #testValidateCompressed"
	self
		assert: (SnappyCore validateCompressed: self shortCompressed0).
	self
		assert: (SnappyCore validateCompressed: self shortCompressed1)