# Alfonso X

[![Build Status](https://travis-ci.com/diegojromerolopez/alfonsox.svg?branch=master)](https://travis-ci.com/diegojromerolopez/alfonsox)
[![Maintainability](https://api.codeclimate.com/v1/badges/053783a6bcd2404df5b1/maintainability)](https://codeclimate.com/github/diegojromerolopez/alfonsox/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/053783a6bcd2404df5b1/test_coverage)](https://codeclimate.com/github/diegojromerolopez/alfonsox/test_coverage)


## What's this?

A simple spellchecking tool to make easy the spellchecking of code files.

The aim is to use it with [overcommit](https://github.com/brigade/overcommit)
and automatically spellcheck code files with a pre-commit git hook.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alfonsox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alfonsox

## Setup

Make sure you have [hunspell](http://hunspell.github.io/) installed
in your system.

No installation of dictionaries is required as this package alredy contains
LibreOffice dictionaries from
[LibreOffice dictionaries repository](https://github.com/LibreOffice/dictionaries).

## Usage

### Load dictionaries

```ruby
# Load Hunspell dictionary from your system
# Make sure you have installed your dictionaries 
dictionary = AlfonsoX::SpellChecker::Dictionary::Hunspell.new('en_US')

# Or, alternatively you can load Hunspell dictionary from a local path
# Make sure the following files exist:
# - YOUR_PATH/dictionaries/en_US/en_US.aff 
# - YOUR_PATH/dictionaries/en_US/en_US.dic 
dictionary = AlfonsoX::SpellChecker::Dictionary::Hunspell.new(
  'en_US', "YOUR_PATH/dictionaries"
)
```

### Spellcheck some files

```ruby
dictionaries = [
  AlfonsoX::SpellChecker::Dictionary::Hunspell.new('en_US'),
  AlfonsoX::SpellChecker::Dictionary::Hunspell.new('es_US')
]
# Create spellchecker
spellchecker = AlfonsoX::SpellChecker::Main.new(
  "directory/with/files/**/*.rb",
  dictionaries
)

# Check the files
incorrect_words = spellchecker.check

# incorrect_words is a dict where
# the keys area the path of each one of the files that have at least one wrong word
# and the values are a list of incorrect words 
```

## Configuration

Create a YML file with the following structure to set up configuration of the spellchecking process:

```yaml
Paths:
  - 'lib/**.rb'
  - 'test/**.rb'
Dictionaries:
  MyEnglishDictionaryFromLocalPath:
    type: 'hunspell'
    path: 'my-local-path/dictionaries'
    language: 'en_US'
  MyEnglishDictionaryFromGem:
      type: 'hunspell'
      language: 'en_US'
  MyRubymineDictionary:
    type: 'rubymine'
    path: '.idea/dictionary.xml'
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/diegojromerolopez/alfonsox]([https://github.com/diegojromerolopez/alfonsox).

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

To sum up, we only talk about this software and respect each other.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The en_US dictionary included in the tests has MIT and BSD license and has been copied from [Titus Wormer's dictionary repository](https://github.com/wooorm/dictionaries/tree/master/dictionaries/en-US).

## Code of Conduct

Everyone interacting in the Alfonso X project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/diegojromerolopez/alfonsox/blob/master/CODE_OF_CONDUCT.md).

## Why the name?

[Alfonso X](https://en.wikipedia.org/wiki/Alfonso_X_of_Castile), called *The Wise*, was a king that reigned [Castile](https://en.wikipedia.org/wiki/Crown_of_Castile) (in Spain) during medieval times.
He was a patron of the languages and pushed for the first orthography rules of Spanish.