# mix phx.gen.context Announcements Announcement announcements content:text

defmodule PhoenixIntercoolerTutorial.Repo.Migrations.CreateAnnouncements do
  use Ecto.Migration

  def change do
    create table(:announcements) do
      add :content, :text, null: false, default: ""

      timestamps()
    end

  end
end
