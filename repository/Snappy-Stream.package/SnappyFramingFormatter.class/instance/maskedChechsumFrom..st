private
maskedChechsumFrom: anInteger
	^((anInteger bitShift: 15) bitOr: (anInteger bitShift: -17)) + 16ra282ead8