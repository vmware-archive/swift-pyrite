class FakeSingleMethod: SingleMethod {
  var theMethodCallCount: Int = 0
  func theMethod() {
    theMethodCallCount += 1
  }

}