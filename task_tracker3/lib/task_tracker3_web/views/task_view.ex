defmodule TaskTracker3Web.TaskView do
  use TaskTracker3Web, :view
  alias TaskTracker3Web.TaskView
  alias TaskTracker3Web.UserView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      title: task.title,
      description: task.description,
      time: task.time,
      completed: task.completed,
      user: render_one(task.user, UserView, "user.json")}

  end
end
