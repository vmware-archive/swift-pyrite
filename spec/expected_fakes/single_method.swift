struct FakeSingleMethod: SingleMethod {
  var callsTotheMethod: Int = 0
  mutating func theMethod() {
    callsTotheMethod += 1
  }

}