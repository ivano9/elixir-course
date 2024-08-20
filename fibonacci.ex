defmodule Fibonacci do
  def fib(n) do
    Cache.lookup(n, fn -> fib(n-2) + fib(n-1) end)
  end
end
