class Clock < HyperComponent
  before_mount { @now = Time.now }
  after_mount { every(1) { mutate @now = Time.now } }

  render(DIV) do
    H1 { 'Clock' }
    P(class: 'green-text') { @now.to_s }
  end
end
