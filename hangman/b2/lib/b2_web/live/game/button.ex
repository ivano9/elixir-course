defmodule B2Web.Live.Game.Button do
    use Phoenix.LiveComponent

    def mount(socket) do
        {:ok, socket}
    end

    def render(assigns) do
        ~H"""
            <div>
                <button
                    phx-click="swap_figure"
                >
                Swap Figure
                </button>
            </div>
        """
    end
end
