reading
readVersionFrom: aStream
	"Currently do not see version seriously"
	| ver |
	ver := aStream next.
	ver > 15 ifTrue: [SnappyFramingError signalWithReason: #BadVersion].