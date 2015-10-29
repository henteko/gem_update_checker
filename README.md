# GemUpdateChecker
This gem is gem update check.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gem_update_checker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gem_update_checker

## Usage

```ruby
require 'gem_update_checker'

gem_name = 'your_gem_name'
current_version = '0.0.1'
if GemUpdateChecker.update_available?(gem_name, current_version)
  puts "update available"
  puts "please run gem update #{gem_name}"
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/henteko/gem_update_checker.

## License
MIT
