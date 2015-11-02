struct FakeSingleMethod: SingleMethod {
  var callsTotheMethod: Int = 0
  func theMethod() {
    callsTotheMethod += 1
  }

}