defmodule PhoenixIntercoolerTutorial.Announcements.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixIntercoolerTutorial.Announcements.Comment


  schema "comments" do
    field :content, :string
    field :announcement_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
