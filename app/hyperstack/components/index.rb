class Index < HyperComponent
  include Hyperstack::Router::Helpers

  render(SECTION, class: :main) do
    return if Todo.count == 0

    INPUT(id: 'toggle-all', class: 'toggle-all', checked: Todo.all_completed?, type: 'checkbox')
      .on(:change) { Todos::ToggleAll.run }
    LABEL(for: 'toggle-all') { 'Mark all as complete' }

    UL(class: 'todo-list') do
      Todo.send(match.params[:scope]).sort_by(&:title).each do |todo|
        TodoItem(todo: todo)
      end
    end
  end
end
