# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_intercooler_tutorial,
  ecto_repos: [PhoenixIntercoolerTutorial.Repo]

# Configures the endpoint
config :phoenix_intercooler_tutorial, PhoenixIntercoolerTutorialWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CiNMiG2R0CNlISjJMz3oaQuBPqzfrsIVutvhw8D+Wom4AisXWbepZVS7/fyTXHZc",
  render_errors: [view: PhoenixIntercoolerTutorialWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixIntercoolerTutorial.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
