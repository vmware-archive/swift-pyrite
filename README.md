# Swift::Pyrite
Pyrite generates instrumented fakes for swift protocols! It is inspired by golang's [counterfeiter](https://github.com/maxbrunsfeld/counterfeiter). 

Pyrite will generate a fake which conforms to the first protocol definition it finds in the input file. Presently it only supports one protocol per file.

For some examples, look in the [spec/protocols](https://github.com/pivotal/swift-pyrite/tree/master/spec/expected_fakes) directory for input, and the spec/[expected_fakes](https://github.com/pivotal/swift-pyrite/tree/master/spec/expected_fakes) directory to see the generated output. 

## Installation

    $ gem install swift-pyrite

## Usage

```
$ pyrite help
Commands:
  pyrite generate INPUT_PATH OUTPUT_PATH  # Generates a fake for protocol in INPUT_PATH and writes it to OUTPUT_PATH
  pyrite help [COMMAND]                   # Describe available commands or one specific command
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pivotal/swift-pyrite. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

