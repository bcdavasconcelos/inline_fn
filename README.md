# InlineFn

There are two methods to change regular markdown footnotes to inline mmd/pandoc-style footnotes.

## Pandoc

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: false

require 'inline_fn'

str = %(Lorem ipsum dolor sit amet[^1], consectetur adipisicing elit[^2], sed...
  [^1]: Text of fn 1
  [^2]: Text of fn 2)

puts str.inline_fn_pandoc
# Lorem ipsum dolor sit amet^[Text of fn 1], consectetur adipisicing elit^[Text of fn 2], sed...
```

## MMD

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: false

require 'inline_fn'

str = %(Lorem ipsum dolor sit amet[^1], consectetur adipisicing elit[^2], sed...
  [^1]: Text of fn 1
  [^2]: Text of fn 2)

puts str.inline_fn_mmd
# Lorem ipsum dolor sit amet[^Text of fn 1], consectetur adipisicing elit[^Text of fn 2], sed...
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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bcdavasconcelos/inline_fn

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
