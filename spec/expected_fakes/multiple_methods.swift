class FakeMultipleMethods: MultipleMethods {
  var firstCallCount: Int = 0
  func first() {
    firstCallCount += 1
  }

  var secondCallCount: Int = 0
  func second() {
    secondCallCount += 1
  }

}