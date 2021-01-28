defmodule BlogWeb.PostControllerTest do
  @moduledoc """
  Post Controller Test module
  """
  use BlogWeb.ConnCase

  @valid_post %{title: "A Valid post", description: "Lorem"}
  @updated_post %{title: "updated 123123", description: "updated 123123"}

  def fixture(:post) do
    {:ok, post} = Blog.Posts.create_post(@valid_post)
    post
  end

  test "list all posts", %{conn: conn} do
    Blog.Posts.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :index))
    assert html_response(conn, 200) =~ "A Valid post"
  end

  test "get an post by id", %{conn: conn} do
    {:ok, post} = Blog.Posts.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :show, post))
    assert html_response(conn, 200) =~ "A Valid post"
  end

  test "enter the form for creating posts", %{conn: conn} do
    conn = get(conn, Routes.post_path(conn, :new))
    assert html_response(conn, 200) =~ "Criar Post"
  end

  test "enter the form for alteration the posts", %{conn: conn} do
    {:ok, post} = Blog.Posts.create_post(@valid_post)

    conn = get(conn, Routes.post_path(conn, :edit, post))
    assert html_response(conn, 200) =~ "Editar Post"
  end

  test "create a post", %{conn: conn} do
    conn = post(conn, Routes.post_path(conn, :create), post: @valid_post)

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == Routes.post_path(conn, :show, id)

    conn = get(conn, Routes.post_path(conn, :show, id))
    assert html_response(conn, 200) =~ "A Valid post"
  end

  test "create a post with invalid values", %{conn: conn} do
    conn = post(conn, Routes.post_path(conn, :create), post: %{})
    assert html_response(conn, 200) =~ "campo obrigatorio"
  end

  describe "dependent on post created the tests below" do
    setup [:create_post]

    test "alterate a post", %{conn: conn, post: post} do
      conn = put(conn, Routes.post_path(conn, :update, post), post: @updated_post)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.post_path(conn, :show, id)

      conn = get(conn, Routes.post_path(conn, :show, id))
      assert html_response(conn, 200) =~ "updated 123123"
    end

    test "alterate a post with invalid values", %{conn: conn, post: post} do
      conn =
        put(conn, Routes.post_path(conn, :update, post), post: %{title: nil, description: nil})

      assert html_response(conn, 200) =~ "Editar Post"
    end

    test "delete", %{conn: conn, post: post} do
      conn = delete(conn, Routes.post_path(conn, :delete, post))

      assert redirected_to(conn) == Routes.post_path(conn, :index)
      assert_error_sent 404, fn -> get(conn, Routes.post_path(conn, :show, post)) end
    end
  end

  defp create_post(_) do
    %{post: fixture(:post)}
  end
end
