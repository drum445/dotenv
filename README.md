# dotenv

Loads a .env file in Crystal and optionally sets values directly into your [ENV](https://crystal-lang.org/api/latest/ENV.html).
Will always return the .env file as a hash regardless of whether you chose to load into your `ENV` or not. Will treat a non-existent
.env file as an empty one.

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

##### Using a file called .env and loading into your `ENV`
```crystal
require "dotenv"

Dotenv.load # => {"ENV" => "dev", "PORT" => "3000", "LOGGING" => "true", "CORS" => "*", "DB_DRIVER" => "mysql", "DB_USERNAME" => "root", "DB_PASSWORD" => "password", "DB_HOST" => "localhost", "DB_PORT" => "3306", "DB_DATABASE" => "test"}
```

##### Using a file called .env and NOT loading into your `ENV`
```crystal
require "dotenv"

hash = Dotenv.load(set_env: false)
```

##### Using a file NOT called .env and loading into your `ENV`
```crystal
require "dotenv"

Dotenv.load(path: ".env.live")
```

### Overriding

By default the existing environment will be overriden by contents of the .env file. To disable this behaviour pass false to override_env parameter:
```crystal
require "dotenv"

hash = Dotenv.load(override_env: false)
```

## Development

1. Clone the repository: `git clone git@github.com:drum445/dotenv.git`.
   There are no dependencies, so no `shards install` is needed (but won't do any harm).
3. Change into the project root directory: `cd dotenv`.
2. Run specs: `crystal spec`.

## Contributing

1. Fork it (<https://github.com/drum445/dotenv/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [drum445](https://github.com/drum445) - creator and maintainer
