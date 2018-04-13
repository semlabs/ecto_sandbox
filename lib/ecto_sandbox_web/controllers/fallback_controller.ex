defmodule EctoSandboxWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use EctoSandboxWeb, :controller

  @doc """
  When an error occurs and a changeset is given, render the error
  """
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(EctoSandboxWeb.ChangesetView, "error.json", changeset: changeset)
  end

  @doc """
  When a route is not found, fall back to this 404 routine and render a page not found.
  """
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(EctoSandboxWeb.ErrorView, :"404")
  end
end
