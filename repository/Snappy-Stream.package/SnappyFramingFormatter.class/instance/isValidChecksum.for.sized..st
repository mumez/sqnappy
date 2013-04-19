private
isValidChecksum: checksum for: dataBytes sized: dataByteSize
	| computedChecksum |
	computedChecksum := (self maskedCrc32cOf: dataBytes sized: dataByteSize).
	^ checksum = computedChecksum