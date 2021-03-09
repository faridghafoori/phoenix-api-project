defmodule PhoenixApiProjectWeb.PostView do
  use PhoenixApiProjectWeb, :view
  alias PhoenixApiProjectWeb.PostView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "postWithTags.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "postWithTags.json")}
  end

  def render("post.json", %{post: post}) do
    IO.inspect post
    %{
      id: post.id,
      title: post.title,
      description: post.description,
      name: post.name,
      tags: render_many(post.tags, PhoenixApiProjectWeb.TagView, "tag.json")
    }
  end

  def render("postWithTags.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      description: post.description,
      name: post.name,
      tags: render_many(post.tags, PhoenixApiProjectWeb.TagView, "tag.json")
    }
  end

end
