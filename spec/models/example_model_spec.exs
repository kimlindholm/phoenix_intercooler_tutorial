defmodule PhoenixIntercoolerTutorial.ExampleModelSpec do
  use ESpec.Phoenix, model: PhoenixIntercoolerTutorial.Example, async: true

  subject build(:example)

  it do: expect(subject().name).to eq "Example 1"
end
