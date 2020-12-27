module Todos
  class ToggleAll
    def initialize
      @all_completed = Todo.all.all?(&:completed)
    end

    def call
      Todo.all.each { |todo| todo.update(completed: !all_completed?) }
    end

    private

    def all_completed?
      @all_completed
    end
  end
end
