class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    todos = Todo.where(user: current_user)
    @incomplete_todos = todos.select {|todo| todo.status == "incomplete"}
    @complete_todos = todos.select {|todo| todo.status == "complete"}
  end

  def create
    @reminder = Reminder.create(
      scheduled_for_date: params[:todo_reminder_scheduled_for_date],
      scheduled_for_time: params[:todo_reminder_scheduled_for_time]
    )
    @todo = Todo.create(todo_param.merge(
      user: current_user,
      status: "incomplete",
      reminders: [@reminder]
    ))
    redirect_to todos_path
  end

  def new
    @todo = Todo.new
  end

  private

  def todo_param
    params.require(:todo).permit(
      :body
    )
  end
end
