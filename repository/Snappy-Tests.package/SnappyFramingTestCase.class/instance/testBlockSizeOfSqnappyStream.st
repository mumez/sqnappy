tests
testBlockSizeOfSqnappyStream
	"self debug: #testBlockSizeOfSqnappyStream"
	| strm |
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 0].
	self assert: (strm blockSize = 32767).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 1].
	self assert: (strm blockSize = 65535).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 2].
	self assert: (strm blockSize = 131071).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 3].
	self assert: (strm blockSize = 262143).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 4].
	self assert: (strm blockSize = 524287).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 5].
	self assert: (strm blockSize = 1048575).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 6].
	self assert: (strm blockSize = 2097151).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 7].
	self assert: (strm blockSize = 4194303).
	
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: -1].
	self assert: (strm blockSize = 32767).
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 8].
	self assert: (strm blockSize = 4194303).
	
	