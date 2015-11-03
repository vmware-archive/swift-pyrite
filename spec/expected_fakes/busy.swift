class FakeBusy: Busy {
  var funkyCallCount: Int = 0
  func funky() {
    funkyCallCount += 1
  }

}