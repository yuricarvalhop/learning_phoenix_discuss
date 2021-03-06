# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :learning_phoenix_discuss,
  ecto_repos: [LearningPhoenixDiscuss.Repo]

# Configures the endpoint
config :learning_phoenix_discuss, LearningPhoenixDiscuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MinoLZdnN5n3xfr0p2B8c/8YL+KYu3CwSjXnDoENWZfRZOAfdbNNJ84Y/lZilPOf",
  render_errors: [view: LearningPhoenixDiscuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LearningPhoenixDiscuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

