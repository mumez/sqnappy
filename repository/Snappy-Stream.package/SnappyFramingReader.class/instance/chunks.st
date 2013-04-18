accessing
chunks

	^ chunks ifNil: [chunks := OrderedCollection new]