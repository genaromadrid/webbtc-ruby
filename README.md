# Webbtc

Webbtc API library for Ruby.

Details of the API use can be found on the [official page][http://webbtc.com/api].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'webbtc-ruby', '~> 0.0.3', github: 'genaromadrid/webbtc-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ git clone https://github.com/genaromadrid/webbtc-ruby.git
    $ cd webbtc-ruby
    $ bundle
    $ gem build webbtc-ruby.gemspec
    $ gem install webbtc-ruby-[version].gem

## Quick start

```ruby
require 'webbtc'
Webbtc.address('18dGd4xtx5F2u7WEg3vsa2K2cT3dzwwZzG')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/webbtc-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
