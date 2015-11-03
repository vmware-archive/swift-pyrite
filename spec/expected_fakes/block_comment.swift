class FakeBlockComment: BlockComment {
  var funkyCallCount: Int = 0
  func funky() {
    funkyCallCount += 1
  }

}