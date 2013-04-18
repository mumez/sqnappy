accessing
blockSizeType: anIntegerOrNil
	anIntegerOrNil ifNil: [^blockSizeType := nil].
	
	blockSizeType := (anIntegerOrNil min: 7) max: 0
	