# Telegraph.rb [DEVELOPING]

​[telegra.ph](telegra.ph) API wrapper written in Ruby :gem: Please note that this wrapper is still under development

## Installation
It will be available as gem soon (but now it is being developed), but for now use following:

```bash
git clone https://github.com/bouncepaw/telegraphrb.git
cd telegraphrb
bundle install
```

The file you need is `lib/telegraph.rb`, just copy it into your project and then require any way you want. When I will finish development, I will make the gem.

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

In the end it returns and prints Ruby hash with symbols as key. You can test it by running `kek.rb` file, which I use for testing:

```bash
ruby kek.rb
Got method: createAccount?short_name=cakemaster
{
        :ok => true,
    :result => {
          :short_name => "cakemaster",
         :author_name => "",
          :author_url => "",
        :access_token => "1efc603709549e01508286f692eb4b02485076aa5029310a16c8631f9517",
            :auth_url => "https://edit.telegra.ph/auth/i827sSEBx44Kkl9tKvmSrcHl9sd0uPbKWbRo2uXzy1"
    }
}
```

Note that this behavior may change because this wrapper is under development.

## Contributing

Fork and write anything you want. Then do a pull request, maybe I will accept it. Try to follow my code style. And yes, I am still developing.