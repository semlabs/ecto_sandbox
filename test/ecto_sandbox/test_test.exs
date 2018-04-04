defmodule EctoSandbox.Test do
  use EctoSandbox.DataCase
  alias EctoSandbox.Repo
  alias EctoSandbox.User

  test "test async write" do

    Server.start_link()
    Server.store("foo")

    assert %User{} = Repo.insert!(%User{name: "bar"})
  end

  test "test wait" do
    Process.sleep(1000)
    assert true
  end
end

defmodule Server do
  use GenServer
  alias EctoSandbox.User
  alias EctoSandbox.Repo

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, []} 
  end

  def store(name) do
    GenServer.cast(__MODULE__, name)
  end

  def handle_cast(name, state) do
    Repo.insert!(%User{name: name})
    {:noreply, state} 
  end
end
