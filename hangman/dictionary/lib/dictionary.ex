defmodule Dictionary do

  alias Dictionary.Runtime.Server

  @type t :: Server.t

  @spec random_word :: String.t
  defdelegate random_word, to: Server
end

