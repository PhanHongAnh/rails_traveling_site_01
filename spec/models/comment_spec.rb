require 'rails_helper'

RSpec.describe Comment, type: :model do
  it {is_expected.to validate_presence_of :body}

  describe ".Associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :commentable}
    it {is_expected.to have_many :comments}
  end
end
