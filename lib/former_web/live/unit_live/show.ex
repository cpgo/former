defmodule FormerWeb.UnitLive.Show do
  use FormerWeb, :live_view

  alias Former.Maps

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:unit, Maps.get_unit!(id))}
  end

  defp page_title(:show), do: "Show Unit"
  defp page_title(:edit), do: "Edit Unit"
end
