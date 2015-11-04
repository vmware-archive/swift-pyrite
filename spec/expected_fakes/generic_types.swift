class FakeGenericTypes: GenericTypes {
  init(t: Array<String>, doStuffReturns: Array<String>) {
    self.t = t
    self.doStuffReturns = doStuffReturns
  }
  var t: Array<String>
  var doStuffCallCount: Int = 0
  var doStuffCalledWith: [(Array<String>)] = [(Array<String>)]()
  var doStuffReturns: Array<String>
  func doStuff(arg: Array<String>) -> Array<String> {
    doStuffCallCount += 1
    doStuffCalledWith.append((arg))
    return doStuffReturns
  }

}
