tests
testWriteSqnappyStreamCustomBlockSize
	"self debug: #testWriteSqnappyStreamCustomBlockSize"
	| strm |
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 1].
	strm nextPutAll: #[1 2 3 ].
	strm nextPutAll: #[4 5 6 7 8].
	self assert: (strm contents = self sqnBiggerBlockBytes1).
	
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 4].
	strm nextPutAll: #[1 2 3 ].
	strm nextPutAll: #[4 5 6 7 8].
	self assert: (strm contents = self sqnBiggerBlockBytes2).
	
	strm := SnappyFraming sqn writeStreamOn: ByteArray new setting: [:s | s blockSizeType: 7].
	strm nextPutAll: #[1 2 3 ].
	strm nextPutAll: #[4 5 6 7 8].
	self assert: (strm contents = self sqnBiggerBlockBytes3).
	
	
