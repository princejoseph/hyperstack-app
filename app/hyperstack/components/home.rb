class Home < HyperComponent
  include Hyperstack::Router::Helpers

  render(DIV) do
    H1 { "Hello world from Hyperstack!" }
    BUTTON {"Click me"}.on(:click) do
      alert("All working!")
      puts "Hurray!"
    end
    SPAN { ' | '}

    Link('/clock') { "Clock" }
    SPAN { ' | '}
    Link('/timer') { "Timer" }
  end
end
