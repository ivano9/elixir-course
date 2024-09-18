defmodule B2Web.Live.Game do
    use Phoenix.LiveView

    def mount(_params, _session, socket) do
        game = Hangman.new_game()
        tally = Hangman.tally(game)
        socket = socket |> assign(%{game: game, tally: tally})
        {:ok, socket}
    end

    def handle_event("make_move", %{"key" => key}, socket) do
        tally = Hangman.make_move(socket.assigns.game, key)
        {:noreply, assign(socket, :tally, tally)}
    end

    def handle_event("swap_figure", _, socket) do
        IO.puts "Hola nada por aca"
        {:noreply, socket}
    end

    def render(assigns) do
        ~H"""
            <div class="game-holder" phx-window-keyup="make_move">
                <.live_component module={__MODULE__.Figure} id={1} tally={@tally}/>
                <.live_component module={__MODULE__.Alphabet} id={2} tally={@tally}/>
                <.live_component module={__MODULE__.WordSoFar} id={3} tally={@tally}/>
                <.live_component module={__MODULE__.FigureRetro} id={4} tally={@tally}/>
                <.live_component module={__MODULE__.Button} id={5}/>
            </div>
        """
    end
end
