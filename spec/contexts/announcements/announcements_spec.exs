defmodule PhoenixIntercoolerTutorial.AnnouncementsSpec do
  use ESpec.Phoenix, model: true, async: true
  alias PhoenixIntercoolerTutorial.Announcements
  alias Announcements.{Announcement, Comment}

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

      context "when id exists" do
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

  describe "comments" do
    describe "list_comments/1" do
      let! :announcement, do: insert(:announcement, comments: [])
      let! :comment_1, do: insert(:comment, announcement_id: announcement().id)
      let! :comment_2, do: insert(:comment, announcement_id: announcement().id)

      let! :other_announcement, do: insert(:announcement, comments: [])
      let! :comment_3, do: insert(:comment, announcement_id: other_announcement().id)

      it "returns comments for given announcement" do
        result = Announcements.list_comments announcement()
        expect(result).to eq [comment_1(), comment_2()]
      end
    end

    describe "get_comment!/1" do
      let! :announcement, do: insert(:announcement, comments: [])
      let! :comment, do: insert(:comment, announcement_id: announcement().id)

      context "when id doesn't exist" do
        it "raises Ecto.NoResultsError" do
          call = fn -> Announcements.get_comment!(-1) end
          expect(call).to raise_exception(Ecto.NoResultsError)
        end
      end

      context "when id exists" do
        it "returns the comment with given id" do
          result = Announcements.get_comment!(comment().id)
          expect(result).to eq comment()
        end
      end
    end

    describe "create_comment/2" do
      context "with non-persisted announcement" do
        let :announcement, do: build(:announcement)
        let :params, do: params_for(:comment)

        it "returns error changeset" do
          result = Announcements.create_comment(announcement(), params())
          expect(result).to match_pattern {:error, %Ecto.Changeset{}}
        end
      end

      context "with invalid params" do
        let :announcement, do: insert(:announcement)
        let :params, do: params_for(:comment, content: nil)

        it "returns error changeset" do
          result = Announcements.create_comment(announcement(), params())
          expect(result).to match_pattern {:error, %Ecto.Changeset{}}
        end
      end

      context "with valid params" do
        let! :announcement, do: insert(:announcement)
        let :params, do: params_for(:comment, content: "New content")
        let! :record_count, do: number_of_records(Comment)
        let :new_record_count, do: number_of_records(Comment)
        let :new_record, do: last_record(Comment)

        it "creates an announcement" do
          result = Announcements.create_comment(announcement(), params())
          expect(result).to be_ok_result()
          expect(new_record_count()).to eq(record_count() + 1)
          expect(new_record().content).to eq "New content"
        end
      end
    end

    describe "update_comment/2" do
      let :announcement, do: insert(:announcement)
      let :comment, do: insert(:comment, announcement_id: announcement().id)

      context "with invalid params" do
        let :params, do: %{content: nil}

        it "returns error changeset" do
          result = Announcements.update_comment(comment(), params())
          expect(result).to match_pattern {:error, %Ecto.Changeset{}}
          comment_from_db = Announcements.get_comment!(comment().id)
          expect(comment_from_db).to eq comment()
        end
      end

      context "with valid params" do
        let :params, do: %{content: "Updated content"}

        it "updates the comment" do
          result = Announcements.update_comment(comment(), params())
          expect(result).to be_ok_result()
          comment_from_db = Announcements.get_comment!(comment().id)
          expect(comment_from_db.content).to eq "Updated content"
        end
      end
    end

    describe "delete_comment/1" do
      let! :announcement, do: insert(:announcement)
      let! :comment, do: insert(:comment, announcement_id: announcement().id)
      let! :record_count, do: number_of_records(Comment)
      let :new_record_count, do: number_of_records(Comment)

      it "deletes the comment" do
        result = Announcements.delete_comment(comment())
        expect(result).to be_ok_result()
        expect(new_record_count()).to eq(record_count() - 1)

        call = fn -> Announcements.get_comment!(comment().id) end
        expect(call).to raise_exception(Ecto.NoResultsError)
      end
    end

    describe "change_comment/1" do
      let :announcement, do: insert(:announcement)
      let :comment, do: insert(:comment, announcement_id: announcement().id)

      it "returns a comment changeset" do
        result = Announcements.change_comment(comment())
        expect(result).to match_pattern %Ecto.Changeset{}
      end
    end
  end

end
