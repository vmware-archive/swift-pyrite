struct FakeMultipleMethods: MultipleMethods {
  var callsTofirst: Int = 0
  mutating func first() {
    callsTofirst += 1
  }

  var callsTosecond: Int = 0
  mutating func second() {
    callsTosecond += 1
  }

}