defmodule PhoenixIntercoolerTutorial.AnnouncementsSpec do
  use ESpec.Phoenix, model: true, async: true
  alias PhoenixIntercoolerTutorial.Announcements
  alias Announcements.Announcement

  describe "announcements" do
    let! :announcement, do: insert(:announcement)

    describe "list_announcements/0" do
      it "returns all announcements" do
        result = Announcements.list_announcements()
        expect(result).to eq [announcement()]
      end
    end

    describe "get_announcement!/1" do
      context "when id doesn't exist" do
        it "raises Ecto.NoResultsError" do
          call = fn -> Announcements.get_announcement!(-1) end
          expect(call).to raise_exception(Ecto.NoResultsError)
        end
      end

      context "when id is exists" do
        it "returns the announcement with given id" do
          result = Announcements.get_announcement!(announcement().id)
          expect(result).to eq announcement()
        end
      end
    end

    describe "create_announcement/1" do
      context "with invalid params" do
        let :params, do: params_for(:announcement, content: nil)

        it "returns error changeset" do
          result = Announcements.create_announcement(params())
          expect(result).to match_pattern {:error, %Ecto.Changeset{}}
        end
      end

      context "with valid params" do
        let :params, do: params_for(:announcement, content: "New content")
        let! :record_count, do: number_of_records(Announcement)
        let :new_record_count, do: number_of_records(Announcement)
        let :new_record, do: last_record(Announcement)

        it "creates an announcement" do
          result = Announcements.create_announcement(params())
          expect(result).to be_ok_result()
          expect(new_record_count()).to eq(record_count() + 1)
          expect(new_record().content).to eq "New content"
        end
      end
    end

    describe "update_announcement/2" do
      context "with invalid params" do
        let :params, do: %{content: nil}

        it "returns error changeset" do
          result = Announcements.update_announcement(announcement(), params())
          expect(result).to match_pattern {:error, %Ecto.Changeset{}}
          announcement_from_db = Announcements.get_announcement!(announcement().id)
          expect(announcement_from_db).to eq announcement()
        end
      end

      context "with valid params" do
        let :params, do: %{content: "Updated content"}

        it "updates the announcement" do
          result = Announcements.update_announcement(announcement(), params())
          expect(result).to be_ok_result()
          announcement_from_db = Announcements.get_announcement!(announcement().id)
          expect(announcement_from_db.content).to eq "Updated content"
        end
      end
    end

    describe "delete_announcement/1" do
      let! :record_count, do: number_of_records(Announcement)
      let :new_record_count, do: number_of_records(Announcement)

      it "deletes the announcement" do
        result = Announcements.delete_announcement(announcement())
        expect(result).to be_ok_result()
        expect(new_record_count()).to eq(record_count() - 1)

        call = fn -> Announcements.get_announcement!(announcement().id) end
        expect(call).to raise_exception(Ecto.NoResultsError)
      end
    end

    describe "change_announcement/1" do
      it "returns an announcement changeset" do
        result = Announcements.change_announcement(announcement())
        expect(result).to match_pattern %Ecto.Changeset{}
      end
    end
  end

end
