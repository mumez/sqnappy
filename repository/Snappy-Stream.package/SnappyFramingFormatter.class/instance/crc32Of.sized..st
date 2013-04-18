private
crc32Of: bytes sized: byteSize
	^ZipWriteStream updateCrc: 16rFFFFFFFF from: 1 to: byteSize in: bytes