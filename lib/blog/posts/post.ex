defmodule Blog.Posts.Post do
  @moduledoc """
  Post schema module
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :description, :string

    timestamps()
  end

  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description], message: "campo obrigatorio")
  end
end
