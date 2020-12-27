# app/hyperstack/components/footer.rb
class CreditsFooter < HyperComponent
  render(FOOTER, class: 'info') do
    P { 'Double-click to edit a todo' }
		P do
      SPAN { 'Credits: ' }
      new_tab_link('https://docs.hyperstack.org/tutorial', 'HyperStack Tutorial')
      SPAN { ', ' }
      new_tab_link('https://github.com/princejoseph', 'Prince Joseph')
    end

    P do
      SPAN { 'Part of ' }
      new_tab_link('http://todomvc.com', 'TodoMVC')
    end
  end

  def new_tab_link(url, title)
    A(href: url, target: '_blank') { title }
  end
end
