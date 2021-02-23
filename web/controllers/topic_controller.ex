defmodule LearningPhoenixDiscuss.TopicController do
  use LearningPhoenixDiscuss.Web, :controller

  alias LearningPhoenixDiscuss.Topic

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
  end
end
