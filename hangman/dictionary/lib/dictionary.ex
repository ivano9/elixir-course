defmodule Dictionary do
  @words "assets/words.txt" # Atributte module like a difine in erlang
    |> File.read!()
    |> String.split(~r/\n/, trim: true)

  def random_word do
    @words
    |> Enum.random()
  end
end
