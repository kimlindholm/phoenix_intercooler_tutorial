# Phoenix + Intercooler Tutorial

[![Ebert](https://ebertapp.io/github/kimlindholm/phoenix_intercooler_tutorial.svg)](https://ebertapp.io/github/kimlindholm/phoenix_intercooler_tutorial)

> Tutorial and demo app

## Description

TBD

## Tutorial

TBD


## Demo App

### Requirements

* Phoenix 1.3.0 or later
* Elixir 1.5 or later
* Erlang 20 or later
* Heroku stack: `heroku-16`

### Installation

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix s`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Deployment

TBD

### Development

Some tools need to be installed globally:

    $ mix archive.install hex sobelow
    $ gem install scss-lint

#### Testing

- Run all tests: `$ mix espec` (same as `$ mix es.all`)
- Run tests other than feature tests: `$ mix es`
- Run feature tests: `$ mix es.feat`
- Test coverage report: `$ mix cov`

Test coverage report is in file `cover/excoveralls.html`.

#### Code Analysis

    $ mix sobelow --config
    $ mix credo
    $ scss-lint assets/css/
    $ cd assets && yarn eslint

## License

TBD
