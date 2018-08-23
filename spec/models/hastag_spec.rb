require 'rails_helper'

RSpec.describe Hastag, type: :model do
  it {is_expected.to validate_presence_of :title}
  it {is_expected.to validate_uniqueness_of(:title).ignoring_case_sensitivity}

  describe ".Associations" do
    it {is_expected.to have_many :hastag_posts}
    it {is_expected.to have_many :reviews}
  end
end
