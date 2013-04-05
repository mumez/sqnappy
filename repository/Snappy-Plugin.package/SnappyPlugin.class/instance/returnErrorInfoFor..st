private
returnErrorInfoFor: statusCode
	"use nagative value for indicating error info"
	interpreterProxy pop: interpreterProxy methodArgumentCount+1.
	interpreterProxy pushInteger: statusCode negated