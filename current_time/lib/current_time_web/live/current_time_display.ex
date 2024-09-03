defmodule CurrentTimeWeb.Live.CurrentTimeDisplay do
  use CurrentTimeWeb, :live_view

  def mount(_params, _session, socket) do
    Process.send_after(self(), :tick, 1000)
    {_, current_time} = :erlang.localtime()
    socket = assign(socket, :current_time, current_time)
    {:ok, socket}
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 1000)
    {_, current_time} = :erlang.localtime()
    socket = assign(socket, :current_time, current_time)
    {:noreply, socket}
  end

  def render(assigns) do
    {hour, min, sec} = assigns.current_time
    ~H"""
      <p><%=hour%>:<%=min%>:<%=sec%></p>
    """
  end
end
