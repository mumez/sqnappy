private-reading
readChecksumFrom: aStream 
	| sz |
	sz := self checksumSize.
	^ (aStream next: sz ) readStream nextLittleEndianNumber: sz