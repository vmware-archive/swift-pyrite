class FakeMultipleVariables: MultipleVariables {
  init(count: Int?, str: String) {
    self.count = count
    self.str = str
  }
  var count: Int?
  var str: String
}