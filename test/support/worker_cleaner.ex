defmodule EctoSandbox.Test.WorkerCleaner do
  defp supervisors do
    [
      EctoSandbox.Workers.Supervisor
    ]
  end

  def cleanup_dynamic_workers() do
    supervisors()
    |> Enum.each(fn sup ->
      DynamicSupervisor.which_children(sup)
      |> Enum.each(fn {_, pid, _, _} -> Supervisor.terminate_child(sup, pid) end)
    end)
  end
end
