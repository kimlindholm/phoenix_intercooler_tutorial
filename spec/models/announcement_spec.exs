defmodule PhoenixIntercoolerTutorial.AnnouncementSpec do
  alias PhoenixIntercoolerTutorial.Announcements.{Announcement, Comment}
  use ESpec.Phoenix, model: Announcement, async: true

  describe "changeset" do
    let :params, do: params_for(:announcement)
    let :changeset, do: Announcement.changeset(%Announcement{}, params())

    it "is valid" do
      expect(changeset().valid?).to be_truthy()
    end

    context "when content is nil" do
      let :params, do: params_for(:announcement, content: nil)

      it "is invalid" do
        expect(changeset().valid?).to be_falsy()
        expect(errors_on(changeset()).content).to have "can't be blank"
      end
    end
  end

  describe "field" do
    let :field_type, do: Announcement.__schema__(:type, field())

    describe "content" do
      let :field, do: :content

      it "is a string" do
        expect(field_type()).to eq :string
      end
    end
  end

  describe "association" do
    let :association, do: Announcement.__schema__(:association, assoc())

    describe "comments" do
      let :assoc, do: :comments

      it "has many comments" do
        expect(association().cardinality).to eq :many
      end

      describe "database constraints" do
        let! :record, do: insert(:announcement)
        before do: expect(record().comments).to_not be_empty()

        it "deletes comments when announcement is deleted" do
          comment = List.first(record().comments)
          call = fn -> Repo.get!(Comment, comment.id) end

          expect(call).to_not raise_exception()
          Repo.delete(record())
          expect(call).to raise_exception(Ecto.NoResultsError)
        end
      end
    end
  end

end
