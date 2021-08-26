# InlineFn

There are two methods that work on strings. Use `str.inline_mmd` for Multimarkdown style or `str.inline_pandoc` for Pandoc style footnotes.


## MMD

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: false

require 'inline_fn'

text = %(Lorem ipsum dolor sit amet[^1], consectetur adipisicing elit[^2], sed...
  [^1]: Text of fn 1
  [^2]: Text of fn 2)

puts text.inline_mmd
```


### Expected result

```
Lorem ipsum dolor sit amet[^Text of fn 1], consectetur adipisicing elit[^Text of fn 2], sed...
```

## Pandoc 

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: false

require 'inline_fn'

text = %(Lorem ipsum dolor sit amet[^1], consectetur adipisicing elit[^2], sed...
  [^1]: Text of fn 1
  [^2]: Text of fn 2)

puts text.inline_pandoc
```

### Expected result

```
Lorem ipsum dolor sit amet^[Text of fn 1], consectetur adipisicing elit^[Text of fn 2], sed...
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inline_fn'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install inline_fn

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/inline_fn.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
