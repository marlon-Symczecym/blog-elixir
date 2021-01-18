defmodule BlogWeb.PostController do
  @moduledoc """
  Post Controller module
  """
  use BlogWeb, :controller

  def index(conn, params) do
    posts = [
      %{
        id: 1,
        title: "Phoenix"
      },
      %{
        id: 2,
        title: "LiveView"
      },
      %{
        id: 3,
        title: "PostgreSQL"
      }
    ]

    render(conn, "index.html", posts: posts)
  end

  def show(conn, params) do
    render(conn, "show.html")
  end
end
