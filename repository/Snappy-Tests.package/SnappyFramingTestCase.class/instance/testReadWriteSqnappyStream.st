tests
testReadWriteSqnappyStream
	"self debug: #testReadWriteSqnappyStream"
	| wstrm originalData compressed rstrm uncompressed |
	wstrm := SnappyFraming sqn writeStreamOn: ByteArray new.
	wstrm blockSizeType: 0.
	originalData := Morph allSelectors asString asByteArray.
	wstrm nextPutAll: originalData.
	compressed := wstrm contents.
	wstrm close.
	self assert: (compressed size < originalData size).
	rstrm := SnappyFraming sqn readStreamOn: compressed.
	uncompressed := rstrm upToEnd.
	rstrm close.
	self assert: (uncompressed = originalData).
	
	wstrm := SnappyFraming sqn writeStreamOn: ByteArray new.
	wstrm blockSizeType: 1.
	wstrm nextPutAll: originalData.
	compressed := wstrm contents.
	wstrm close.
	self assert: (compressed size < originalData size).
	rstrm := SnappyFraming sqn readStreamOn: compressed.
	uncompressed := rstrm upToEnd.
	rstrm close.
	
	