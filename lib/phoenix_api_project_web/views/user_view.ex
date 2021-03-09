defmodule PhoenixApiProjectWeb.UserView do
  use PhoenixApiProjectWeb, :view
  alias PhoenixApiProjectWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      name: user.name,
      posts: render_many(user.posts, PhoenixApiProjectWeb.PostView, "post.json"),
    }
  end

end
