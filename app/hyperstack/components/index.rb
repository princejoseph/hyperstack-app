# app/hyperstack/components/index.rb
class Index < HyperComponent
  include Hyperstack::Router::Helpers

  render(SECTION, class: :main) do
    return if Todo.count == 0

    INPUT(id: 'toggle-all', class: 'toggle-all', checked: all_todo_completed?, type: 'checkbox')
      .on(:click) do
        all_checked = all_todo_completed?
        Todo.all.each { |todo| todo.update(completed: !all_checked) }
      end
    LABEL(for: 'toggle-all') { 'Mark all as complete' }

    UL(class: 'todo-list') do
      Todo.send(match.params[:scope]).sort_by(&:title).each do |todo|
        TodoItem(todo: todo)
      end
    end
  end

  def all_todo_completed?
    Todo.all.all?(&:completed)
  end
end
