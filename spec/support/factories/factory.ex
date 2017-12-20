defmodule PhoenixIntercoolerTutorial.Factories.Factory do
  use ExMachina.Ecto, repo: PhoenixIntercoolerTutorial.Repo
  alias PhoenixIntercoolerTutorial.Announcements.{Announcement, Comment}

  @moduledoc """
  Test factories.
  """

  def announcement_factory do
    %Announcement{
      content: Faker.Lorem.sentence(),
      comments: [
        build(:comment),
        build(:comment)
      ]
    }
  end

  def comment_factory do
    %Comment{
      content: Faker.Lorem.sentence(),
      announcement_id: -1
    }
  end

end
