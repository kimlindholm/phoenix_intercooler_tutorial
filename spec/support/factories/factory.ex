defmodule PhoenixIntercoolerTutorial.Factories.Factory do
  use ExMachina.Ecto, repo: PhoenixIntercoolerTutorial.Repo
  alias PhoenixIntercoolerTutorial.Announcements.Announcement

  @moduledoc """
  Test factories.
  """

  def announcement_factory do
    %Announcement{
      content: Faker.Lorem.sentence()
    }
  end

end
