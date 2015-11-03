class FakeWithVariables: WithVariables {
  init(i: Int, s: String) {
    self.i = i
    self.s = s
  }
  var i: Int
  var s: String
  var fCallCount: Int = 0
  func f() {
    fCallCount += 1
  }

}