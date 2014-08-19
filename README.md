# RedissifyModel

It acts as a cache key value store for Sequel Models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redissify_model'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redissify_model

## Usage

### Configuring

Create a file named `redissify_model.rb` somewhere on autoload paths and add this line to configure your project name:

```ruby
Redissify::Config.project_name = "your_project_name"
```
    
### Model
Unfortunately it only supports Sequel Ruby ORM. I will update it soon to support ActiveRecord too.

```ruby
Class TestModel < Sequel::Model
  include Redissify
end
```

Get the Model instance quickly with Redis query
```ruby
TestModel.get_redis_ins(id)
=> #<TestModel @values={:id=>1, :name=>"test", :age=>13}
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/redissify_model/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
