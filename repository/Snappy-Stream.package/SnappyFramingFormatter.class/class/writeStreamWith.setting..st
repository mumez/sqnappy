actions
writeStreamWith: aByteArray setting: settingBlock
	| writing |
	writing := self writing.
	settingBlock value: writing.
	^ writing with: aByteArray