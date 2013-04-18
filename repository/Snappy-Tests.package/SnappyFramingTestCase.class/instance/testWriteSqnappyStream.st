tests
testWriteSqnappyStream
	"self debug: #testWriteSqnappyStream"
	| strm |
	strm := SnappyFraming sqn writeStreamOn: ByteArray new.
	strm nextPutAll: #[1 2].
	strm nextPut: 3.
	strm nextPutAll: #[4 5 6 ].
	self assert: (strm contents = #[255 83 113 78 1 0 1 0 6 1 2 3 4 5 6]).
	
	strm := SnappyFraming sqn writeStreamWith: #[9 8 7].
	strm nextPutAll: #[1 2].
	strm nextPut: 3.
	strm nextPutAll: #[4 5 6 ].
	self assert: (strm contents = #[9 8 7 255 83 113 78 1 0 1 0 6 1 2 3 4 5 6])