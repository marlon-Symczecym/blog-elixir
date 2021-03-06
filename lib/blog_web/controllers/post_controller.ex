defmodule BlogWeb.PostController do
  @moduledoc """
  Post Controller module
  """
  use BlogWeb, :controller

  alias Blog.{Posts, Posts.Post}

  def index(conn, _params) do
    posts = Posts.list_posts()

    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post}) do
    case Posts.create_post(post) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post criado com sucesso")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    changeset = Post.changeset(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get_post!(id)

    case Posts.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post atualizado com sucesso")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, post: post)
    end
  end

  def delete(conn, %{"id" => id}) do
    Posts.delete_post(id)

    conn
    |> put_flash(:info, "O post foi deletado")
    |> redirect(to: Routes.post_path(conn, :index))
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)

    render(conn, "show.html", post: post)
  end
end
