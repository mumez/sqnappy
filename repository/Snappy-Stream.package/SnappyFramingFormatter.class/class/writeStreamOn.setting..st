actions
writeStreamOn: aByteArrayOrReadStream setting: settingBlock
	| writing |
	writing := self writing.
	settingBlock value: writing.
	^ writing on: aByteArrayOrReadStream