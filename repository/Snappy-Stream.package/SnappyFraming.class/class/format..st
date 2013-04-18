instance creation
format: formatSymbol
	"(SnappyFraming format: #sz) readStreamOn: #[1 2 3]"
	"(SnappyFraming format: #sqn) writeStreamOn: #[1 2 3]"
	"strm := SnappyFraming sqn writeStreamWith: ByteArray new"
	formatSymbol == #sz ifTrue: [^SnappyFramingFormatter].
	formatSymbol == #sqn ifTrue: [^SnappySqnappyFormatter].
	SnappyFramingError signalWithReason: #FormatNotSupported