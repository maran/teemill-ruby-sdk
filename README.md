# Ruby SDK for the Teemill API

## How to use

### Authentication

For most requests, all you need to provide is an API key

```ruby
Teemill.api_key = '<your api key>'
```

For some legacy requests you must instead provide a bearer token

```ruby
Teemill.bearer_token = '<your bearer token api key>'
```

### Custom Products

```ruby
custom_product = Teemill::CustomProduct.create({
    image_url: 'https://domain.com/path/to/image.png'
})
```
