defmodule HangmanImplGameTest do
    use ExUnit.Case
    alias Hangman.Impl.Game

    test "new game returns structure" do
        game = Game.new_game

        assert game.turns_left == 7
        assert game.game_state == :initializing
        assert length(game.letters) > 0
    end

    test "new game returns correct word" do
        game = Game.new_game("wombat")

        assert game.turns_left == 7
        assert game.game_state == :initializing
        assert game.letters == ["w", "o", "m", "b", "a", "t"]
    end

    test "new game returns letters lower-case" do
        game = Game.new_game
        word = List.to_string(game.letters)
        assert word == String.downcase(word, :ascii)
    end
end

