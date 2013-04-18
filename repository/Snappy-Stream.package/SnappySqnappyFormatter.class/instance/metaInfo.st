accessing
metaInfo
	"2 bytes metaInfo
	[15-12] reserved
	[11-8] version (0-15)
	[7-3] reserved
	[2-0] block size type (0-7)"

	^ ByteArray with: self version with: self blockSizeType