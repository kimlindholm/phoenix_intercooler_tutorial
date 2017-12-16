defmodule PhoenixIntercoolerTutorial.Factories.Factory do
  use ExMachina.Ecto, repo: PhoenixIntercoolerTutorial.Repo

  @moduledoc """
  Test factories.
  """

  def example_factory do
    %{
      name: "Example 1",
      email: sequence(:email, &"email-#{&1}@example.com"),
    }
  end

end
