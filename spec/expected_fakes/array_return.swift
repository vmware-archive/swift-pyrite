class FakeArrayReturn: ArrayReturn {
  init(stringifyReturns: [String]) {
    self.stringifyReturns = stringifyReturns
  }
  var stringifyCallCount: Int = 0
  var stringifyCalledWith: [(Int)] = [(Int)]()
  var stringifyReturns: [String]
  func stringify(x: Int) -> [String] {
    stringifyCallCount += 1
    stringifyCalledWith.append((x))
    return stringifyReturns
  }

}
