struct FakeMultipleMethods: MultipleMethods {
  var callsTofirst: Int = 0
  func first() {
    callsTofirst += 1
  }

  var callsTosecond: Int = 0
  func second() {
    callsTosecond += 1
  }

}