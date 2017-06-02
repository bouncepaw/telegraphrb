# Telegraph.rb
[telegra.ph](telegra.ph) API wrapper written in Ruby :gem:

## Installation
It will be available as gem soon, but for now use following:

```bash
git clone https://github.com/bouncepaw/telegraphrb.git
cd telegraphrb
```

The file you need is `lib/telegraph.rb`, just copy it into your project and then require any way you want.

## Usage

Be sure to read the [API](telegra.ph). This wrapper implements all the methods of the API. You can use either `snake_case` or `camelCase` . I recommend `snake_case`, because it is Ruby. For example:

```ruby
require_relative "telegraph"

Telegraph.create_account({
  :short_name => "testbouncepaw",
  :author_url => "https://github.com/bouncepaw/telegraphrb"
})
```

As you can see, we pass a hash with parameters to a method. You can also do following:

```ruby
require_relative "telegraph"

params = {
  :short_name => "testbouncepaw",
  :author_url => "https://github.com/bouncepaw/telegraphrb"
}

Telegraph.create_account params
```

## Contributing

Fork and write anything you want. Then do a pull request, maybe I will accept it. Try to follow my code style.