private
signalFromStatusCode: statusCode
	| reason |
	reason := statusCode negated caseOf: {
		[-1]->[#BufferTooSmall].
		[-2]->[#InvalidInput].
	} otherwise: [#Unknown].
	
	^ SnappyError signalWithReason: reason