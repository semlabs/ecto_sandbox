defmodule EctoSandboxWeb.Router do
  use EctoSandboxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EctoSandboxWeb do
    pipe_through :api
  end
end
