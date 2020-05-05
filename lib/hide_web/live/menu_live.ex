defmodule HideWeb.MenuLive do
  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <image href="<%= @href %>"></image>
    """

    # If you instead render another rect everything is fine
    # ~L"""
    # <rect x="10" y="10" width="20" height="20"></rect>
    # """
  end
end
