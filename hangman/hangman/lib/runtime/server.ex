defmodule Hangman.Runtime.Server do
    @type t :: pid

    @idle_timeout 1 * 60 * 60 * 1000   # 1 hour

    alias Hangman.Impl.Game
    alias Hangman.Runtime.Watchdog

    use GenServer

    ### client process
    def start_link(_) do
        GenServer.start_link(__MODULE__, nil)
    end

    ### server process
    def init(_) do
        watcher = Watchdog.start(@idle_timeout)
        :logger.notice("new game begin created")
        {:ok, {Game.new_game, watcher}}
    end

    def handle_call({:make_move, guess}, _from, {game, watcher}) do
        Watchdog.im_alive(watcher)
        {update_game, tally} = Game.make_move(game, guess)
        {:reply, tally, {update_game, watcher}}
    end

    def handle_call({:tally}, _from, {game, watcher}) do
        Watchdog.im_alive(watcher)
        {:reply, Game.tally(game), {game, watcher}}
    end
end
