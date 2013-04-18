accessing
blockSize
	"Answer the value of blockSize"

	^ blockSize ifNil: [blockSize := self computeBlockSize]