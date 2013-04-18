tests
testBlockSizeOfSqnappyStream
	"self debug: #testBlockSizeOfSqnappyStream"
	| strm |
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 0].
	self assert: (strm blockSize = 32768).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 1].
	self assert: (strm blockSize = 65536).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 2].
	self assert: (strm blockSize = 131072).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 3].
	self assert: (strm blockSize = 262144).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 4].
	self assert: (strm blockSize = 524288).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 5].
	self assert: (strm blockSize = 1048576).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 6].
	self assert: (strm blockSize = 2097152).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 7].
	self assert: (strm blockSize = 4194304).
	
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: -1].
	self assert: (strm blockSize = 32768).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 8].
	self assert: (strm blockSize = 4194304).
	
	