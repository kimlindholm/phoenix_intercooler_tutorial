defmodule PhoenixIntercoolerTutorial.ExampleFeatureSpec do
  use ESpec.Phoenix, controller: :feature, async: true

  example_group feature: true do
    it "visits main page" do
      navigate_to("/")
      expect(visible_page_text()).to match "Welcome"
      save_screenshot "Main page"
    end
  end

end
