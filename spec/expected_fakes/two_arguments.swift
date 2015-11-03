class FakeTwoArguments: TwoArguments {
  var callsTodouble: Int = 0
  var argsTodouble: [(Int, String)] = [(Int, String)]()
  func double(x: Int, str: String) {
    callsTodouble += 1
    argsTodouble.append((x, str))
  }

}