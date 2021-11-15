defmodule FormerWeb.PageController do
  use FormerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
