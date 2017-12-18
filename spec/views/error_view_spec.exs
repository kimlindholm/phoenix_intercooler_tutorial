defmodule PhoenixIntercoolerTutorial.ErrorViewSpec do
  alias PhoenixIntercoolerTutorialWeb.ErrorView
  use ESpec.Phoenix, view: ErrorView, async: true

  let :content, do: render_to_string(ErrorView, template(), [])

  describe "404.html" do
    let :template, do: "404.html"
    it "renders 404.html" do
      expect(content()).to eq "Page not found"
    end
  end

  describe "500.html" do
    let :template, do: "500.html"
    it "renders 500.html" do
      expect(content()).to eq "Internal server error"
    end
  end

  describe "any other" do
    let :template, do: "505.html"
    it "renders 500.html" do
      expect(content()).to eq "Internal server error"
    end
  end

end
