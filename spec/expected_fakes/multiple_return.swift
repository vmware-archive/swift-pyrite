class FakeMultipleReturn: MultipleReturn {
  init(stuffReturns: (String, Int)) {
    self.stuffReturns = stuffReturns
  }
  var stuffCallCount: Int = 0
  var stuffReturns: (String, Int)
  func stuff() -> (String, Int) {
    stuffCallCount += 1
    return stuffReturns
  }

}
