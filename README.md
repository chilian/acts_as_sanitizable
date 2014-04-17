# acts_as_sanitizable [![Gem Version](https://badge.fury.io/rb/acts_as_sanitizable.svg)](http://badge.fury.io/rb/acts_as_sanitizable) [![Build Status](https://travis-ci.org/chilian/acts_as_sanitizable.svg?branch=master)](https://travis-ci.org/chilian/acts_as_sanitizable) [![Code Climate](https://codeclimate.com/github/chilian/acts_as_sanitizable.png)](https://codeclimate.com/github/chilian/acts_as_sanitizable)

Sanitizable concern to sanitize activerecord model attributes the way you like. E.g. very useful if you want to convert empty strings from your form params into `nil`...  

## Installation

Add `acts_as_sanitizable` to your `Gemfile`:

```ruby
gem 'acts_as_sanitizable'
```

Download and install by running:

```
bundle install
```

## Usage

Add the `sanitizes` method to your model to perform sanitization on specific attributes. You can define what type of sanitization you want to do by specifing a `:with` option or a block.

```ruby
class User < ActiveRecord::Base   
  sanitizes :first_name, :last_name, with: :strip
  sanitizes :email, with: [:strip, :downcase]
  sanitizes :biography, with: ->(biography) { biography.squish }
  sanitizes :username do |username|
    # strip leading "@" characters as used in Twitter usernames
    username.strip.downcase.sub(/\A@/, '')
  end
end
```

The `sanitizes` method is aliased as `acts_as_sanitizable`.

Sanitization is performed `before_validation` so the sanitized content will only be visible after calling the `valid?` or `save` methods on your instance of the model.

### Contexts

You can define when sanitization should be performed via `:on`. If no `:on` parameter is specified acts_as_sanitizable will sanitize on both, create and update.

```ruby
class User < ActiveRecord::Base
  sanitizes :first_name, with: :strip, on: :create
  sanitizes :last_name, with: :strip, on: :update
end
```

### Inheritance

```ruby
class User < ActiveRecord::Base   
  sanitizes :first_name, :last_name, with: :strip
  sanitizes :email, with: [:strip, :downcase], on: :create
end
```

If you wish to not sanitize specific attributes on an inherited model you can call `skip_sanitization_on`. When you have been using a context in the sanitizer definition be sure to specify the same one when using `skip_sanitization_on`.

```ruby
class Admin < User
  skip_sanitization_on :first_name
  skip_sanitization_on :email, on: :create
end
```

### Reflection

You can return a list of all sanitized attributes by calling:

```ruby
User.sanitizable_attributes # => [#<Sanitizable::AttributeSanitizer name: :first_name, ...>, ...]

User.sanitizable_attribute_names # => [:first_name, :last_name, ...]
```

## Contributing to acts_as_sanitizable

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.

- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.

- Fork the project.

- Start a feature/bugfix branch.

- Commit and push until you are happy with your contribution.

- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.

- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.
