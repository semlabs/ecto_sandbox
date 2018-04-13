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
  username: System.get_env("DB_USER") || "postgres",
  password: System.get_env("DB_PASSWORD") || "postgres",
  database: System.get_env("DB_NAME") || "ecto_sandbox_test",
  hostname: System.get_env("DB_HOST") || "0.0.0.0",
  pool: Ecto.Adapters.SQL.Sandbox
