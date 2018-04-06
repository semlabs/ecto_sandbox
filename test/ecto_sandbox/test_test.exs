defmodule EctoSandbox.Test do
  use EctoSandbox.DataCase
  alias EctoSandbox.Repo
  alias EctoSandbox.User
  alias Ecto.UUID
  alias EctoSandbox.ServerSupervisor

  setup do
    {:ok, pid} = ServerSupervisor.start_child(UUID.generate())
    {:ok, server: pid}
  end

  test "test async write", %{server: server} do
    Server.store(server, "1")

    assert %User{} = Repo.insert!(%User{name: "1.1"})
    GenServer.stop(server)
  end

  test "test wait", %{server: server} do
    Server.store(server, "2")

    assert %User{} = Repo.insert!(%User{name: "2.1"})
    GenServer.stop(server)
  end

  test "test three", %{server: server} do
    Server.store(server, "3")

    assert %User{} = Repo.insert!(%User{name: "3.1"})
    GenServer.stop(server)
  end
end
