defmodule BlogWeb.PostController do
  @moduledoc """
  Post Controller module
  """
  use BlogWeb, :controller

  alias Blog.Posts.Post

  def index(conn, _params) do
    posts = Blog.Repo.all(Post)

    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def show(conn, %{"id" => id}) do
    post = Blog.Repo.get(Post, id)

    render(conn, "show.html", post: post)
  end
end
