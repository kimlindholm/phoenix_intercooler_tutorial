defmodule PhoenixIntercoolerTutorial.Announcements.Announcement do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixIntercoolerTutorial.Announcements.{Announcement, Comment}

  @moduledoc """
  The Announcement schema.
  """

  schema "announcements" do
    field :content, :string
    has_many :comments, Comment # foreign key: delete_all

    timestamps()
  end

  @doc false
  def changeset(%Announcement{} = announcement, attrs) do
    announcement
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
