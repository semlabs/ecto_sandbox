defmodule EctoSandboxWeb.Router do
  use EctoSandboxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EctoSandboxWeb do
    pipe_through :api

    post("/test", Controller, :store)
  end
end
