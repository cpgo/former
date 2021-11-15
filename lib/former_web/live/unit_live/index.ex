defmodule FormerWeb.UnitLive.Index do
  use FormerWeb, :live_view

  alias Former.Maps
  alias Former.Maps.Unit

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Maps.subscribe()
    {:ok, assign(socket, :units, list_units()), temporary_assigns: [units: []]}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Unit")
    |> assign(:unit, Maps.get_unit!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Unit")
    |> assign(:unit, %Unit{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Units")
    |> assign(:unit, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    unit = Maps.get_unit!(id)
    {:ok, _} = Maps.delete_unit(unit)

    {:noreply, assign(socket, :units, list_units())}
  end

  @impl true
  def handle_info({:unit_created, unit}, socket) do
    {:noreply, update(socket, :units, fn units -> [unit | units] end)}
  end
  def handle_info({:unit_updated, unit}, socket) do
    {:noreply, update(socket, :units, fn units -> [unit | units] end)}
  end

  defp list_units do
    Maps.list_units()
  end
end
