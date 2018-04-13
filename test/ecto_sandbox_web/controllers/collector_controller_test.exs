defmodule EctoSandboxWeb.CollectorControllerTest do
  use EctoSandboxWeb.ConnCase
  alias EctoSandbox.Workers

  setup %{conn: conn} do
    {:ok, worker} =
      %{
        "description" => "some description"
      }
      |> Workers.create()

    EctoSandbox.Notification.subscribe(:chunk_stored)

    conn =
      conn
      |> put_req_header("content-type", "application/json")

    {:ok, conn: conn, worker: worker}
  end

  test "Test 1", %{conn: conn, worker: worker} do
    conn = post(conn, "/collectors/#{worker.id}", ~s({"data": "test"}))

    assert conn.status == 201
    assert_receive {:chunk_stored, "stored"}
  end

  test "Test 2", %{conn: conn, worker: worker} do
    conn = post(conn, "/collectors/#{worker.id}", ~s({"data": "test"}))

    assert conn.status == 201
    assert_receive {:chunk_stored, "stored"}
  end

  test "Test 3", %{conn: conn, worker: worker} do
    conn = post(conn, "/collectors/#{worker.id}", ~s({"data": "test"}))

    assert conn.status == 201
    assert_receive {:chunk_stored, "stored"}
  end
end
