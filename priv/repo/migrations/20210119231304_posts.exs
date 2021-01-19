defmodule Blog.Repo.Migrations.Posts do
  @moduledoc """
  Post Migration module
  """
  use Ecto.Migration

  def change do
    create table :posts do
      add :title, :string
      add :description, :text

      timestamps()
    end
  end
end
