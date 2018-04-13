use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ecto_sandbox, EctoSandboxWeb.Endpoint,
  http: [port: 4011],
  debug_errors: true,
  server: true

# Print only warnings and errors during test
config :logger, level: :error

# Configure your database
config :ecto_sandbox, EctoSandbox.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "runner",
  password: "semaphoredb",
  database: "ecto_sandbox_test",
  hostname: "0.0.0.0",
  pool: Ecto.Adapters.SQL.Sandbox,
  ownership_log: :error
