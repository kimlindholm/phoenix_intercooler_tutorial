defmodule PhoenixIntercoolerTutorial.ExampleFeatureSpec do
  use ESpec.Phoenix, controller: :feature, async: true

  example_group feature: true do
    it "visits main page" do
      navigate_to("/")
      expect(page_title()).to match "Hello"
    end
  end

end
