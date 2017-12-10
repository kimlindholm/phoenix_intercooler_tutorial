defmodule PhoenixIntercoolerTutorial.ExampleModelSpec do
  use ESpec.Phoenix, model: PhoenixIntercoolerTutorial.Example, async: true

  it "does something" do
    expect(true).to be_falsy
  end
end
