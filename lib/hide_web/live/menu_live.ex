defmodule HideWeb.MenuLive do
  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <image id="image" href="<%= @href %>"></image>
    """
  end
end
