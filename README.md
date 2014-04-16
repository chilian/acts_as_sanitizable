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

Add the `sanitizes`-method to your model:

```
class User < ActiveRecord::Base   
  sanitizes :content, with: :squish
  sanitizes :content, :another_attribute, :nth_attribute, with: [:strip, :upcase]
  sanitizes :content do |content|
    content.squish.downcase
  end
  sanitizes :content, with: ->(content) { content.squish.downcase }
end
```


## Contributing to acts_as_sanitizable

Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.

Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.

Fork the project.

Start a feature/bugfix branch.

Commit and push until you are happy with your contribution.

Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.

Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.
