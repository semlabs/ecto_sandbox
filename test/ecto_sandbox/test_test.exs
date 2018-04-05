defmodule EctoSandbox.Test do
  use EctoSandbox.DataCase
  alias EctoSandbox.Repo
  alias EctoSandbox.User

  test "test async write" do
    Server.store("foo")

    assert %User{} = Repo.insert!(%User{name: "bar"})
  end

  test "test wait" do
    Process.sleep(1000)

    Server.store("1")

    assert %User{} = Repo.insert!(%User{name: "2"})
  end
end
