defmodule Lists do
  def len([]), do: 0

  def len([_head | tail]), do: 1 + len(tail)

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def double([]), do: 0
  def double([head | tail]), do: [2*head | double(tail)]

  def square([]), do: 0
  def square([head | tail]), do: [head*head | square(tail)]
  
  def even_length?([]), do: true
  def even_length?([h | t]), do: rem(1 + len(t), 2) == 0
end
