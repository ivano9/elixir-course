defmodule Cache do

  def start(state) do
    # pid = spawn_link(Procs, :init, [state])
    # send pid, :start
    {:ok, pid} = Agent.start_link(fn -> state end)
    :persistent_term.put({__MODULE__, :agent}, pid)
    pid
  end

  def lookup(n, resolve) do
     Agent.get(get_agent(), fn map -> map[n] end)
     |> maybe_resolve(get_agent(), n, resolve)
  end
  
  defp maybe_resolve(nil, agent, n, resolve) do
    resolve.()
    |> put(agent, n)
  end

  defp maybe_resolve(value, _cache, _n, _resolve) do
    value
  end

  defp put(value, agent, n) do
    Agent.get_and_update(
      agent,
      fn map -> {value, Map.put(map, n, value)} end)
  end

  defp get_agent do
    default = start(%{0 => 0, 1 => 1})
    :persistent_term.get({__MODULE__, :agent}, default)
  end
end
