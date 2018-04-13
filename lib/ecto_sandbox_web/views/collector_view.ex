defmodule EctoSandboxWeb.CollectorView do
  use EctoSandboxWeb, :view
  alias EctoSandboxWeb.CollectorView

  @doc """
  Render many chunk
  """
  def render("index.json", %{chunk: chunk}) do
    %{
      data: render_many(chunk, CollectorView, "chunk.json")
    }
  end

  @doc """
  Render one chunk
  """
  def render("show.json", %{chunk: chunk}) do
    %{
      data: render_one(chunk, CollectorView, "chunk.json")
    }
  end

  @doc """
  Structure of rendered chunk
  """
  def render("chunk.json", %{collector: %{data: nil}}) do
    nil
  end

  def render("chunk.json", %{collector: %{data: data}}) do
    Poison.decode!(data)
  end
end
