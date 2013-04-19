tests
testReadStream
	"self debug: #testReadStream"
	| bytes conts strm |
	bytes := #[255 6 0 0 115 78 97 80 112 89 1 10 0 0 3 100 81 146 49 50 51 52 53 10].
	strm := SnappyFraming sz readStreamOn: bytes.
	conts := strm contents.
	strm close.
	self assert: (conts = #[49 50 51 52 53 10])