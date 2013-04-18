testing
hasValidChecksumFor: dataBytes sized: dataByteSize
	^ self formatter isValidChecksum: self checksum for: dataBytes sized: dataByteSize