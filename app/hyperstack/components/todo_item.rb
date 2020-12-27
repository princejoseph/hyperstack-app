# app/hyperstack/components/todo_item.rb
class TodoItem < HyperComponent
  param :todo

  render do
    LI(class: todo_class) do
      if @editing
        EditItem(class: :edit, todo: todo)
          .on(:saved, :cancel) { mutate @editing = false }
      else
        INPUT(type: :checkbox, class: :toggle, checked: todo.completed)
          .on(:change) { todo.update(completed: !todo.completed) }
        LABEL { todo.title }
          .on(:double_click) { mutate @editing = true }
      end
      BUTTON(class: :destroy)
        .on(:click) { todo.destroy if confirm('Are you sure?') }
    end
  end

  def todo_class
    if todo.completed
      'completed'
    else @editing
      'editing'
    end
  end
end
