# mix phx.gen.context Announcements Comment comments content:text announcement_id:references:announcements

defmodule PhoenixIntercoolerTutorial.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text
      add :announcement_id, references(:announcements, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:announcement_id])
  end
end
