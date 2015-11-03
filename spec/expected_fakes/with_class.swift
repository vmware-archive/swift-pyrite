class FakeTheProtocol: TheProtocol {
  var aMethodCallCount: Int = 0
  func aMethod() {
    aMethodCallCount += 1
  }

}