class Timer < HyperComponent
  before_mount { @seconds = 0 }
  after_mount { every(1) { mutate @seconds += 1 } }

  render(DIV) do
    H1 { 'Timer' }
    P(class: 'green-text') { "Running for #{@seconds} seconds" }
  end
end
