tests
testReadSqnappyStream
	"self debug: #testReadSqnappyStream"
	| strm bytes |
	strm := SnappyFraming sqn readStreamOn: self sqnBytes1.
	self assert: (strm contents = self origBytes1).
	strm reset.
	self assert: ((strm next: 3) = (self origBytes1 copyFrom: 1 to: 3)).
	bytes := #[].
	[strm atEnd] whileFalse: [bytes := bytes copyWith: strm next].
	self assert: ((bytes) = (self origBytes1 copyFrom: 4 to: self origBytes1 size)).
	
	strm := SnappyFraming sqn readStreamOn: self sqnBytes2.
	self assert: (strm contents = self origBytes1).
	strm reset.
	self assert: ((strm next: 3) = (self origBytes1 copyFrom: 1 to: 3)).
	bytes := #[].
	[strm atEnd] whileFalse: [bytes := bytes copyWith: strm next].
	self assert: ((bytes) = (self origBytes1 copyFrom: 4 to: self origBytes1 size)).
	
	strm := SnappyFraming sqn readStreamOn: self sqnBytes3.
	self assert: (strm contents = self origBytes2).
	strm reset.
	self assert: ((strm next: 5) = (self origBytes2 copyFrom: 1 to: 5)).
	bytes := #[].
	[strm atEnd] whileFalse: [bytes := bytes copyWith: strm next].
	self assert: ((bytes) = (self origBytes2 copyFrom: 6 to: self origBytes2 size)).