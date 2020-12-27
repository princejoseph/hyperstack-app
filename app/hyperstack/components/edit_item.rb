class EditItem < HyperComponent
  param :todo
  fires :saved
  fires :cancel
  other :etc

  after_mount { jQ[dom_node].focus }

  render do
    INPUT(etc, placeholder: 'What needs to be done?',
          defaultValue: todo.title, key: todo)
      .on(:enter) { |evt| update_todo(evt) }
      .on(:blur) { cancel! }
  end


  def update_todo(evt)
    todo.update(title: evt.target.value)
    saved!
    evt.target.focus
  end
end
