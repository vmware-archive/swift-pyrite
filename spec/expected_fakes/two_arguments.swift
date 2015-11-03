class FakeTwoArguments: TwoArguments {
  var doubleCallCount: Int = 0
  var doubleCalledWith: [(Int, String)] = [(Int, String)]()
  func double(x: Int, str: String) {
    doubleCallCount += 1
    doubleCalledWith.append((x, str))
  }

}