use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ecto_sandbox, EctoSandboxWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ecto_sandbox, EctoSandbox.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DB_USER") || "postgres",
  password: System.get_env("DB_PASSWORD") || "postgres",
  database: System.get_env("DB_NAME") || "postgres",
  hostname: System.get_env("DB_HOST") || "0.0.0.0",
  port: System.get_env("DB_PORT") || "5433",
  pool: Ecto.Adapters.SQL.Sandbox

config :swarm,
  sync_nodes_timeout: 0

