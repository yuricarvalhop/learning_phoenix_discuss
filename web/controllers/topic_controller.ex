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
        |> redirect(to: topic_path(conn, :index))
      { :error, changeset } ->
          render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => id}) do
    topic = Repo.get(Topic, id)
    changeset = Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, %{"topic" => topic, "id"=> id}) do
    old_topic = Repo.get(Topic, id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
      { :ok, _message } ->
        conn
        |> put_flash(:info, "Topic updated!")
        |> redirect(to: topic_path(conn, :index))
      { :error, changeset } ->
          render conn, "edit.html", topic: old_topic, changeset: changeset
    end

    render conn, "index.html"
  end

  def delete(conn, %{"id" => id}) do
    Repo.get!(Topic, id) |> Repo.delete!

    conn
      |> put_flash(:info, "Topic Deleted!")
      |> redirect(to: topic_path(conn, :index))
  end
end
