# == Schema Information
#
# Table name: projects
#
#  id                   :bigint           not null, primary key
#  branch               :string
#  color                :string
#  contributors         :integer          default(1), not null
#  data                 :json             not null
#  dependents           :integer
#  description          :string
#  forks                :integer          default(0), not null
#  github               :string           not null
#  github_about         :text
#  hidden_at            :datetime
#  last_activity_at     :datetime
#  last_commit          :string
#  meta_last_updated_at :datetime
#  name                 :string           not null
#  pulse                :integer
#  rails_major_version  :integer          not null
#  readme               :text
#  short_blurb          :text
#  skylight_url         :string
#  slug                 :string           not null
#  stars                :integer          default(0), not null
#  watchers             :integer          default(1), not null
#  website              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_projects_on_created_at_desc_for_feed  (created_at DESC,hidden_at,last_activity_at)
#  index_projects_on_hidden_at                 (hidden_at)
#  index_projects_on_slug                      (slug) UNIQUE
#
require "rails_helper"

RSpec.describe Project do
  describe "#skylight_url" do
    it "can store a valid Skylight URL" do
      project = described_class.create!(
        name: "Test Project",
        slug: "test-project",
        github: "test/project",
        rails_major_version: 7,
        data: {},
        skylight_url: "https://oss.skylight.io/app/applications/XYZ/recent/6h/endpoints"
      )

      expect(project.skylight_url).to eq("https://oss.skylight.io/app/applications/XYZ/recent/6h/endpoints")
    end

    it "is invalid with a bad URL" do
      project = described_class.new(
        name: "Bad Project",
        slug: "bad-project",
        github: "bad/project",
        rails_major_version: 7,
        data: {},
        skylight_url: "not-a-url"
      )

      expect(project).not_to be_valid
      expect(project.errors[:skylight_url]).to be_present
    end
  end
end
