# app/hyperstack/component/app.rb

# This is your top level component, the rails router will
# direct all requests to mount this component.  You may
# then use the Route psuedo component to mount specific
# subcomponents depending on the URL.

class App < HyperComponent
  include Hyperstack::Router

  # define routes using the Route psuedo component.  Examples:
  # Route('/foo', mounts: Foo)                : match the path beginning with /foo and mount component Foo here
  # Route('/foo') { Foo(...) }                : display the contents of the block
  # Route('/', exact: true, mounts: Home)     : match the exact path / and mount the Home component
  # Route('/user/:id/name', mounts: UserName) : path segments beginning with a colon will be captured in the match param
  # see the hyper-router gem documentation for more details
  #
  # Route('/clock', mounts: Clock)

  # render(DIV) do
  #   Route('/clock', mounts: Clock)
  #   Route('/timer', mounts: Timer)
  #   Route('/', mounts: Home)
  #
  #   H1 { "Number of Todos: #{Todo.count}" }
  # end
  #

  render do
    Clock()
    Timer()

    SECTION(class: 'todoapp') do
      Header()
      Route('/', exact: true) { Redirect('/all') }
      Route('/:scope', mounts: Index)
      Footer()
    end

    CreditsFooter()
  end
end
