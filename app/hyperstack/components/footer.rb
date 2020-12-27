# app/hyperstack/components/footer.rb
class Footer < HyperComponent
  include Hyperstack::Router::Helpers

  render do
    return if Todo.count == 0

    FOOTER(class: :footer) do
      SPAN(class: 'todo-count') { "#{pluralize(Todo.active.count, 'item')} left" }

      UL(class: :filters) do
        link_item(:all)
        link_item(:active)
        link_item(:completed)
      end

      if Todo.completed.count > 0
        BUTTON(class: 'clear-completed') { 'Clear completed' }
          .on(:click) { Todo.completed.each(&:destroy) }
      end
    end
  end

  def link_item(path)
    LI { NavLink("/#{path}", active_class: :selected) { path.camelize } }
  end
end
