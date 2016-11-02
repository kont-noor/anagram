# Anagram

A tool to check anagrams

## installation

add this line to your application's gemfile:

```ruby
gem 'anagram'
```

and then execute:

    $ bundle

or install it yourself as:

    $ gem install anagram

## usage

* install the gem
* create the source file (input.txt) as described [here](https://gist.github.com/lebedev-yury/4b0e50b81f072c303e3f12d6cc3d6b4e#file-readme-md)
* run the following: `console input.txt output.txt`
* open `output.txt` to get result

If you want to integrate the tool to your application just add the following code:

```ruby
require 'anagram/file_iterator'

iterator = Anagram::FileIterator.new('source.txt')
iterator.result # a result as an array
iterator.save_to('target.txt')
```

You can even check a single line:

```ruby
require 'anagram/line_parser'

Anagram::LineParser.parse('"wisdom" ? "mid sow"')
```

## development

after checking out the repo, run `bin/setup` to install dependencies. then, run `rake spec` to run the tests. you can also run `bin/console` for an interactive prompt that will allow you to experiment.

to install this gem onto your local machine, run `bundle exec rake install`. to release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## contributing

bug reports and pull requests are welcome on github at https://github.com/[username]/anagram. this project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [contributor covenant](http://contributor-covenant.org) code of conduct.


## license

the gem is available as open source under the terms of the [mit license](http://opensource.org/licenses/mit).

