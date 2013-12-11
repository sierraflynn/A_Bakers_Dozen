require "spec_helper"

describe Comment do

  before { @comment = Comment.new(content: "Yummy", rating: 4, user_id: 1, recipe_id: 1) }

  subject { @comment }

  it { should respond_to(:rating) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:recipe_id) }
  it { should be_valid }

  describe "when content is not present" do
    before { @comment.content = nil }
    it { should_not be_valid }
  end

  describe "when rating is not present" do
    before { @comment.rating = nil }
    it { should_not be_valid }
  end

  describe "when user has been deleted" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when recipe has been deleted" do
    before { @comment.recipe_id = nil }
    it { should_not be_valid }
  end
end
