module Todos
  class ToggleAll < Hyperstack::Operation
    step { Todo.all_completed? }
    step { |all_completed| Todo.all.each { |todo| todo.update(completed: !all_completed) } }
  end
end
