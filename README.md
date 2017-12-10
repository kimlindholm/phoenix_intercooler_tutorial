# PhoenixIntercoolerTutorial

[![CircleCI](https://circleci.com/gh/kimlindholm/phoenix_intercooler_tutorial/tree/integration_tests.svg?style=shield)](https://circleci.com/gh/kimlindholm/phoenix_intercooler_tutorial/tree/integration_tests)
[![Coverage Status](https://coveralls.io/repos/github/kimlindholm/phoenix_intercooler_tutorial/badge.svg?branch=integration_tests)](https://coveralls.io/github/kimlindholm/phoenix_intercooler_tutorial?branch=integration_tests)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Development

* Install [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/) (e.g. `brew install chromedriver`)
* Before running tests, start ChromeDriver with `chromedriver` or run as a service with `brew services start chromedriver` (MacOS)

### Command Line

* Run tests: `$ mix espec`
* Test coverage report: `$ mix cov`
* Interactive shell: `$ iex -S mix` (exit by pressing Ctrl+C twice)

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
