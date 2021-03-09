defmodule PhoenixApiProject.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :name, :string
    field :title, :string
    belongs_to :user, PhoenixApiProject.Blog.User
    has_many :tags, PhoenixApiProject.Blog.Tag

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :name])
    |> validate_required([:title, :description, :name])
  end
end
