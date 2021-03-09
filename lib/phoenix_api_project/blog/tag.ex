defmodule PhoenixApiProject.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    field :type, :string
    belongs_to :post, PhoenixApiProject.Blog.Post

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
