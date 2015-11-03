struct FakeOneArgument: OneArgument {
  var callsTodouble: Int = 0
  var argsTodouble: [(Int)] = [(Int)]()
  mutating func double(x: Int) {
    callsTodouble += 1
    argsTodouble.append((x))
  }

}