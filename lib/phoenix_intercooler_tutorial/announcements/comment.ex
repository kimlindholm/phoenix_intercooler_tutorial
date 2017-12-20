defmodule PhoenixIntercoolerTutorial.Announcements.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixIntercoolerTutorial.Announcements.{Comment, Announcement}

  @moduledoc """
  The Comment schema.
  """

  schema "comments" do
    field :content, :string
    belongs_to :announcement, Announcement

    timestamps()
  end

  @doc false
  def create_changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:content, :announcement_id])
    |> validate_required([:content, :announcement_id])
    |> foreign_key_constraint(:announcement_id)
  end

  @doc false
  def update_changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
