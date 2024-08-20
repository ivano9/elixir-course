defmodule Procs do

  def hello(count) do
    receive do
      {:crash, reason} ->
        exit(reason)
    {:reset} ->
        hello(0)
      {:quit} ->
        IO.puts "I'm outta here"
      {:add, n} ->
        hello(count+n)
      msg ->
        IO.puts "#{count}: #{inspect msg}"
        hello(count)
    end
  end

  def greeter(what_to_say) do
    receive do
      msg ->
        IO.puts "#{what_to_say}: #{msg}"
    end
    greeter(what_to_say)
  end

  def init(pid) when is_pid(pid) do
    receive do
      :agent ->
        pid
      :stop ->
        exit(:normal)
    end
    init(pid)
  end

  def init(state) do
    receive do
      :start ->
        {:ok, pid} = Agent.start_link(fn -> state end)
        init(pid)
      :stop ->
        exit(:normal)
    end
  end

end
