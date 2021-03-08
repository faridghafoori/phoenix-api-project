defmodule PhoenixApiProject.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :description, :text
      add :name, :string

      timestamps()
    end

  end
end
