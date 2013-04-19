tests
testMaskedCrc32c
	"self debug: #testMaskedCrc32c"
	| buffer val |
	buffer := #[49 50 51 52 53 10].
	val := SnappyCore maskedCrc32cOf: buffer sized: buffer size.
	self assert: (val = 2454807555).