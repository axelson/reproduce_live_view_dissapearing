defmodule HideWeb.MenuLive do
  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    options =
      ["opt1", "option 2"]
      |> Enum.with_index()

    ~L"""
    <g transform="translate(50 100)" class="menu" id="myid">
      <%= for {option, index} <- options do %>
        <%= render_option(option, index, assigns) %>
      <% end %>
    </g>
    """
  end

  def render_option(option, index, assigns) do
    ~L"""
    <g transform="translate(0 <%= index * 50 %>)" phx-click="menu-click" phx-target="<%= @myself %>">
    <text><%= option %></text>
    </g>
    """
  end

  def handle_event("menu-click", _event, socket) do
    IO.inspect(socket.assigns, label: "socket.assigns")
    IO.puts("Handle menu click!")
    {:noreply, assign(socket, set_time: true)}
  end
end
