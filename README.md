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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bcdavasconcelos/inline_fn

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
