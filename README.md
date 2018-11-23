# dotenv

Loads .env file in Crystal and optionally loads them directly into your ENV var: https://crystal-lang.org/api/0.27.0/ENV.html  
Will always return the .env file as a hash regardless of whether you chose to load into your ENV or not

## Installation

1. Add the dependency to your `shard.yml`:
```yaml
dependencies:
  dotenv:
    github: drum445/dotenv
```
2. Run `shards install`

## Usage

```crystal
require "dotenv"
```

Having a .env file
```
ENV=dev
PORT=3000
LOGGING=true
CORS=*

DB_DRIVER=mysql
DB_USERNAME=root
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=test
```

##### Using a file called .env and loading into your ENV var
```
require "dotenv"

Dotenv.load # => {"ENV" => "dev", "PORT" => "3000", "LOGGING" => "true", "CORS" => "*", "DB_DRIVER" => "mysql", "DB_USERNAME" => "root", "DB_PASSWORD" => "password", "DB_HOST" => "localhost", "DB_PORT" => "3306", "DB_DATABASE" => "test"}
```

##### Using a file called .env and NOT loading into your ENV var
```
require "dotenv"

hash = Dotenv.load(set_env: false)
```

##### Using a file NOT called .env and loading into your ENV var
```
require "dotenv"

Dotenv.load(path: ".env.live")
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/drum445/dotenv/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [drum445](https://github.com/drum445) - creator and maintainer
