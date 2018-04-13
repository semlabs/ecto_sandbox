defmodule EctoSandbox.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(EctoSandbox.Repo, []),
      supervisor(EctoSandboxWeb.Endpoint, []),
      supervisor(EctoSandbox.Workers.Supervisor, [[]]),
      supervisor(Phoenix.PubSub.PG2, [EctoSandbox.Notification.name(), []]),
      worker(Registry, [[keys: :unique, name: Reg]])
    ]

    opts = [strategy: :one_for_one, name: EctoSandbox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    EctoSandboxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
