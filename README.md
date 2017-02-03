# DevTools *(deprecated)*

## This code-base has been split into independent repositories.

**Please visit the appropriate repo depending on what you were
originally looking for:**

- [Base Class (for developing your own modules)](https://github.com/dyoung522/devtools-base)
- [jdiff](https://github.com/dyoung522/devtools-jdiff)
- [prlist](https://github.com/dyoung522/devtools-prlist)
- [runtest](https://github.com/dyoung522/devtools-runtest)

This repository will remain as-is but will no longer be under development.

# Original README follows...

DevTools is a compilation of utilities created to make the development process easier.

## Installation

Install it from the command line

    $ gem install ora-dev-tools

## Usage

Once installed, this gem provides several, mostly independent, utilities

- `runtest` : Runs test suites with an optional search pattern
- `jdiff`   t co: Compares two git branches and shows a diff of JIRA stories
- `prlist`  : Polls git repos and displays a queue of stories ready for QA

Future Development

- RunEnv  : Starts and manages a development environment

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on [our GitHub page](https://github.com/dyoung522/devtools)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

