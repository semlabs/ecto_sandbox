defmodule EctoSandbox.Test do
  use EctoSandbox.DataCase
  alias EctoSandbox.Repo
  alias EctoSandbox.User

  test "test async write" do
    Server.store("1")

    assert %User{} = Repo.insert!(%User{name: "1.1"})
  end

  test "test wait" do
    Server.store("2")

    assert %User{} = Repo.insert!(%User{name: "2.1"})
  end

  test "test three" do
    Server.store("3")

    assert %User{} = Repo.insert!(%User{name: "3.1"})
  end
end
