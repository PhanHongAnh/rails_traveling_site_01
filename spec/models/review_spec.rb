require 'rails_helper'

RSpec.describe Review, type: :model do
  it {is_expected.to validate_presence_of :title}
  it {is_expected.to validate_presence_of :content}

  describe "#hastags_list" do
    subject {create :review}
    it "returns as a string" do
      expect(subject.hastags_list).to eq("hastag1, hastag2, hastag3")
    end
  end

  describe ".Associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to have_many :comments}
    it {is_expected.to have_many :hastag_posts}
    it {is_expected.to have_many :hastags}
  end
end
