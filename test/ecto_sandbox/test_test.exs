defmodule EctoSandbox.Test do
  use EctoSandboxWeb.ConnCase
  alias EctoSandbox.Repo
  alias EctoSandbox.User
  alias Ecto.UUID
  alias EctoSandbox.ServerSupervisor

  setup %{conn: conn} do
    server = UUID.generate()

    conn =
      conn
      |> put_req_header("content-type", "application/json")

    {:ok, _pid} = ServerSupervisor.start_server(server)
    {:ok, server: server, conn: conn}
  end

  test "test async write", %{conn: conn, server: server} do
    conn = post(conn, "/test", Poison.encode!(%{server: server, value: "1"}))

    assert conn.status == 204

    assert %User{} = Repo.insert!(%User{name: "1.1"})
  end

  test "test wait", %{server: server, conn: conn} do
    conn = post(conn, "/test", Poison.encode!(%{server: server, value: "2"}))

    assert %User{} = Repo.insert!(%User{name: "2.1"})
  end

  test "test three", %{server: server, conn: conn} do
    conn = post(conn, "/test", Poison.encode!(%{server: server, value: "3"}))

    assert %User{} = Repo.insert!(%User{name: "3.1"})
  end
end
