defmodule PhoenixIntercoolerTutorial.CommentSpec do
  alias PhoenixIntercoolerTutorial.Announcements.Comment
  use ESpec.Phoenix, model: Comment, async: true

  describe "create changeset" do
    let :params, do: params_for(:comment)
    let :changeset, do: Comment.create_changeset(%Comment{}, params())

    it "is valid" do
      expect(changeset().valid?).to be_truthy()
    end

    context "when content is nil" do
      let :params, do: params_for(:comment, content: nil)

      it "is invalid" do
        expect(changeset().valid?).to be_falsy()
        expect(errors_on(changeset()).content).to have "can't be blank"
      end
    end

    context "when announcement_id is nil" do
      let :params, do: params_for(:comment, announcement_id: nil)

      it "is invalid" do
        expect(changeset().valid?).to be_falsy()
        expect(errors_on(changeset()).announcement_id).to have "can't be blank"
      end
    end

    context "when announcement_id points to a non-existing record" do
      let :params, do: params_for(:comment, announcement_id: -1)

      it "is invalid" do
        result = Repo.insert changeset()
        expect(result).to be_error_result()
        {:error, new_changeset} = result
        expect(errors_on(new_changeset).announcement_id).to have "does not exist"
      end
    end
  end

  describe "update changeset" do
    let! :announcement, do: insert(:announcement)
    let! :comment, do: insert(:comment, content: "Original content",
      announcement_id: announcement().id)
    let :params, do: %{content: "Updated content"}
    let :changeset, do: Comment.update_changeset(comment(), params())

    it "is valid" do
      expect(changeset().valid?).to be_truthy()
    end

    context "when content is nil" do
      let :params, do: %{content: nil}

      it "is invalid" do
        expect(changeset().valid?).to be_falsy()
        expect(errors_on(changeset()).content).to have "can't be blank"
      end
    end

    context "with new announcement_id" do
      let! :other_announcement, do: insert(:announcement)
      let :params, do: %{content: "Updated content",
        announcement_id: other_announcement().id}

      it "ignores input and keeps the old value" do
        expect(comment().announcement_id).to eq announcement().id
        result = Repo.update changeset()
        expect(result).to be_ok_result()
        comment_from_db = Repo.get!(Comment, comment().id)
        expect(comment_from_db.content).to eq "Updated content"
        expect(comment_from_db.announcement_id).to eq announcement().id
      end
    end
  end

  describe "field" do
    let :field_type, do: Comment.__schema__(:type, field())

    describe "content" do
      let :field, do: :content

      it "is a string" do
        expect(field_type()).to eq :string
      end
    end
  end

  describe "association" do
    let :association, do: Comment.__schema__(:association, assoc())

    describe "announcement" do
      let :assoc, do: :announcement

      it "belongs to announcement" do
        expect(association()).to match_pattern %Ecto.Association.BelongsTo{}
      end
    end
  end

end
