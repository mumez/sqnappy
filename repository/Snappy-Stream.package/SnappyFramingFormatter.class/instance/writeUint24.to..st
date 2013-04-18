private-writing
writeUint24: value to: stream
	stream nextLittleEndianNumber: 3 put: value