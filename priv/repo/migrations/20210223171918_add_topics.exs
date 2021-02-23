defmodule LearningPhoenixDiscuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
      add :description, :string

      timestamps
    end
  end
end
