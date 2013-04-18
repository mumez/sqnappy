private
isValidChecksum: checksum for: dataBytes sized: dataByteSize
	| computedChecksum |
	computedChecksum := self
				maskedChechsumFrom: (self crc32Of: dataBytes sized: dataByteSize).
	^ checksum = computedChecksum