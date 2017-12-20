# mix phx.gen.context Announcements Comment comments content:text announcement_id:references:announcements

defmodule PhoenixIntercoolerTutorial.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text, null: false, default: ""
      add :announcement_id,
          references(:announcements, on_delete: :delete_all),
          null: false

      timestamps()
    end

    create index(:comments, [:announcement_id])
  end
end
