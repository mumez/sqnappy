accessing
blockSizeType

	^ blockSizeType ifNil: [blockSizeType := self defaultBlockSizeType]