struct FakeSingleMethod: SingleMethod {
  var callsToTheMethod: Int
  func theMethod() {
    callsToTheMethod += 1
  }
}
