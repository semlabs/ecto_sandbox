defmodule EctoSandboxWeb.CollectorController do
  use EctoSandboxWeb, :controller
  alias EctoSandbox.Workers.Worker

  action_fallback(EctoSandboxWeb.FallbackController)

  def store(%Plug.Conn{body_params: content} = conn, %{"worker_id" => id}) do
    with {:ok, chunk} <- Worker.work(id, content) do
      conn
      |> put_status(:created)
      |> render("show.json", chunk: chunk)
    end
  end
end
