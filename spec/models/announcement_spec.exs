defmodule PhoenixIntercoolerTutorial.AnnouncementSpec do
  alias PhoenixIntercoolerTutorial.Announcements.Announcement
  use ESpec.Phoenix, model: Announcement, async: true

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
