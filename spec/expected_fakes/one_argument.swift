class FakeOneArgument: OneArgument {
  var doubleCallCount: Int = 0
  var doubleCalledWith: [(Int)] = [(Int)]()
  func double(x: Int) {
    doubleCallCount += 1
    doubleCalledWith.append((x))
  }

}