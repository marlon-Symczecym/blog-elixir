defmodule BlogWeb.PostControllerTest do
  @moduledoc """
  Post Controller Test module
  """
  use BlogWeb.ConnCase

  @valid_post %{title: "Phoenix Framework", description: "Lorem"}

  test "list all posts", %{conn: conn} do
    Blog.Posts.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :index))
    assert html_response(conn, 200) =~ "Phoenix Framework"
  end
end