defmodule HideWeb.MenuLive do
  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <g transform="translate(50 100)" class="menu">
      <text>Menu</text>
    </g>
    """
  end
end
