# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ecto_sandbox,
  ecto_repos: [EctoSandbox.Repo]

# Configures the endpoint
config :ecto_sandbox, EctoSandboxWeb.Endpoint,
  version: Mix.Project.config[:version],
  url: [host: "localhost"],
  secret_key_base: "some_secret",
  render_errors: [view: EctoSandboxWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: EctoSandbox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ecto_sandbox, EctoSandbox.Repo,
  migration_primary_key: [id: :uuid, type: :uuid]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
