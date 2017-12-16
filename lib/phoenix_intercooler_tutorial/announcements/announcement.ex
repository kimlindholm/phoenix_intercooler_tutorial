defmodule PhoenixIntercoolerTutorial.Announcements.Announcement do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixIntercoolerTutorial.Announcements.Announcement


  schema "announcements" do
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(%Announcement{} = announcement, attrs) do
    announcement
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
