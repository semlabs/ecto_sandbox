defmodule EctoSandboxWeb.Router do
  use EctoSandboxWeb, :router

  use Plug.ErrorHandler

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :decode_json do
    plug(
      Plug.Parsers,
      parsers: [:urlencoded, :json],
      pass: ["*/*"],
      json_decoder: Poison
    )
  end

  scope "/", EctoSandboxWeb do
    pipe_through([:decode_json, :api])

    post("/collectors/:worker_id", CollectorController, :store)
    post("/collectors", CollectorController, :store)
  end
end
