class FakeMultipleReturn: MultipleReturn {
  var stuffCallCount: Int = 0
  var stuffReturns: (String, Int)
  func stuff() -> (String, Int) {
    stuffCallCount += 1
    return stuffReturns
  }

}