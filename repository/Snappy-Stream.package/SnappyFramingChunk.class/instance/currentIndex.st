accessing
currentIndex
	"Answer the value of currentIndex"

	^ currentIndex ifNil: [currentIndex := 0]