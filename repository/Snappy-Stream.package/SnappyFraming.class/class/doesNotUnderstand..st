system primitives
doesNotUnderstand: aMessage
	
	(aMessage selector isUnary) ifTrue: [
		^ [self format: aMessage selector] on: SnappyFramingError do: [:ex | super doesNotUnderstand: aMessage]
	].
	
	^ super doesNotUnderstand: aMessage