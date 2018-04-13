defimpl Plug.Exception, for: Phoenix.ActionClauseError do
  def status(_exception), do: 422
end
