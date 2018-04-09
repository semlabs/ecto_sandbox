defmodule EctoSandboxWeb.Controller do
  use EctoSandboxWeb, :controller

  alias EctoSandbox.ServerSupervisor
  
  def store(conn, %{"server" => server, "value" => value}) do
    server
    |> ServerSupervisor.get()
    |> Server.store(value)

    send_resp(conn, :no_content, "")
  end
end
