defmodule EctoSandbox.Application do
  use Application
  alias EctoSandbox.ServerSupervisor

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(EctoSandbox.Repo, []),
      supervisor(EctoSandboxWeb.Endpoint, []),
      supervisor(ServerSupervisor, [])
    ]

    opts = [strategy: :one_for_one, name: EctoSandbox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    EctoSandboxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
