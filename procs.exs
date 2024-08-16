defmodule Procs do

  def hello(count) do
    receive do
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
end
