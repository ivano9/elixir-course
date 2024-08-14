defmodule Hangman do
    alias Hangman.Impl.Game

    @type   state :: :initializing | :won | :lost | :good_guess | :bad_guess | :already_used
    @opaque game  :: Game.t
    @type   tally :: %{
        turns_left: integer,
        game_state: state,
        letters: list(String.t),
        used: list(String.t)
    }

    @spec new_game() :: game
    defdelegate new_game, to: Game # defdelegate init_game, to: Game, as: :new_game

    @spec make_move(game, String.t) :: {game, tally}
    def make_move(_game, _guess) do

    end

end
