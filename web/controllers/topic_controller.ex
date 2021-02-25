defmodule LearningPhoenixDiscuss.TopicController do
  use LearningPhoenixDiscuss.Web, :controller

  alias LearningPhoenixDiscuss.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)

    render conn, "index.html", topics: topics
  end

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      { :ok, _message } ->
        conn
        |> put_flash(:info, "New topic created!")
        |> redirect(to: topic_path(conn, :new))
      { :error, changeset } ->
          render conn, "new.html", changeset: changeset
    end
  end

  def destroy(conn, %{"id" => id}) do
    topic = Repo.get(Topic, id)
    case Repo.delete(topic) do
      { :ok, _message } ->
        conn
        |> put_flash(:info, "Topic Deleted!")
        |> redirect(to: topic_path(conn, :index))
      { :error, changeset } ->
          render conn, "index.html"
    end
  end
end
