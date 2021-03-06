defmodule HideWeb.PageLive do
  use HideWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Process.sleep(2000)
    {:ok, assign(socket, menu: false, show_rect: nil)}
  end

  @impl true
  def handle_event("show-rect", _, socket) do
    socket = assign(socket, show_rect: true)
    {:noreply, socket}
  end

  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, assign(socket, results: search(query), query: query)}
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    case search(query) do
      %{^query => vsn} ->
        {:noreply, redirect(socket, external: "https://hexdocs.pm/#{query}/#{vsn}")}

      _ ->
        {:noreply,
         socket
         |> put_flash(:error, "No dependencies found matching \"#{query}\"")
         |> assign(results: %{}, query: query)}
    end
  end

  def image do
    Routes.static_url(HideWeb.Endpoint, "/images/phoenix.png")
    |> IO.inspect(label: "static")
  end

  defp search(query) do
    if not HideWeb.Endpoint.config(:code_reloader) do
      raise "action disabled when not in development"
    end

    for {app, desc, vsn} <- Application.started_applications(),
        app = to_string(app),
        String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
        into: %{},
        do: {app, vsn}
  end
end
