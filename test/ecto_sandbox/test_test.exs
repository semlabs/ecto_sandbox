defmodule EctoSandbox.Test do
  use EctoSandbox.DataCase
  alias EctoSandbox.Repo
  alias EctoSandbox.User
  alias Ecto.UUID
  alias EctoSandbox.ServerSupervisor

  setup do
    server = UUID.generate()

    {:ok, _pid} = ServerSupervisor.start_server(server)
    {:ok, server: server}
  end

  test "test async write", %{server: server} do
    server
    |> ServerSupervisor.get()
    |> Server.store("1")

    assert %User{} = Repo.insert!(%User{name: "1.1"})
    server
    |> ServerSupervisor.get()
    |> GenServer.stop()
  end

  test "test wait", %{server: server} do
    server
    |> ServerSupervisor.get()
    |> Server.store("2")

    assert %User{} = Repo.insert!(%User{name: "2.1"})
    server
    |> ServerSupervisor.get()
    |> GenServer.stop()
  end

  test "test three", %{server: server} do
    server
    |> ServerSupervisor.get()
    |> Server.store("3")

    assert %User{} = Repo.insert!(%User{name: "3.1"})
    server
    |> ServerSupervisor.get()
    |> GenServer.stop()
  end
end
