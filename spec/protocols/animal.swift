protocol Animal {
	var lives: Int { get }
	var legs: Int { get set }

	func speak() -> String
}

struct AnimalImpl: Animal {
	var lives: Int = 1
	var legs: Int = 4

	func speak() {
		print("aslkdjald")
	}
}