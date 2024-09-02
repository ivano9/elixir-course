defmodule B1Web.HangmanController do
  use B1Web, :controller

    def new_path(conn, _params) do
        Router.Helpers.page_path(conn, :new)
    end

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def new(conn, _params) do
      game = Hangman.new_game()
      conn
      |> put_session(:game, game)
      |> redirect(to: "/show")
  end

    def update(conn, params) do
        guess = params["make_move"]["guess"]

        put_in(conn.params["make_move"]["guess"], "")
        |> get_session(:game)
        |> Hangman.make_move(guess)

        redirect(conn, to: B1Web.Router.Helpers.page_path(conn, :show, "/"))
    end

    def show(conn, _params) do
        tally =
            conn
            |> get_session(:game)
            |> Hangman.tally()
        render(conn, :game, tally: tally)
    end

    def name() do

    end
end
