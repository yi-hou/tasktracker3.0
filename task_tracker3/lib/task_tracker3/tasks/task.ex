defmodule TaskTracker3.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time, :integer
    field :title, :string

    belongs_to :user, TaskTracker3.Users.User
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time, :completed, :user_id])
    |> validate_required([:title, :description, :time, :completed, :user_id])
  end
end
