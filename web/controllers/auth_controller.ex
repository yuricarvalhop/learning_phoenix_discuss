defmodule LearningPhoenixDiscuss.AuthController do
  use LearningPhoenixDiscuss.Web, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.inspect(conn)
    IO.inspect(params)
  end
end
