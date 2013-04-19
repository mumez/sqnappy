tests
testWriteStream
	"self debug: #testWriteStream"
	| conts strm |
	strm := SnappyFraming sz writeStreamOn: ByteArray new.
	strm nextPutAll: #[49 50 51 52 53 10].
	conts := strm contents.
	self assert: (conts =  #[255 6 0 0 115 78 97 80 112 89 1 10 0 0 3 100 81 146 49 50 51 52 53 10])