require "spec_helper"
#require "user"

describe User do

  before { @user = User.new(username: "Example User", name: "user", password: "test", password_confirmation: "test") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:name) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }

  it { should respond_to(:chef) }


  it { should be_valid }
  it { should_not be_chef }

  describe "with chef attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:chef)
    end

    it { should be_chef }
  end

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end

  describe "when password confirm is not present" do
    before { @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when username is too long" do
    before { @user.username = "a" * 26 }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" * 2 }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" * 3 }
    it { should_not be_valid }
  end

  #following
  describe "following" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save
      @user.follow!(other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(@user) }
    end
  end
   
  describe "recipe associations" do
    before { @user.save }
    let!(:older_recipes) do
      FactoryGirl.create(:recipe, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_recipes) do
       FactoryGirl.create(:recipe, user: @user, created_at: 1.hour.ago)
    end
    #feed
    describe "status" do
      let(:unfollowed_recipes) do
        FactoryGirl.create(:recipe, user: FactoryGirl.create(:user))
      end
      let(:followed_user) { FactoryGirl.create(:user) }

      before do
        @user.save!
        @user.follow!(followed_user)
        3.times { followed_user.recipes.create!(name: "Lorem ipsum", ingredients: "..", instructions: "..", picture: "..") }
      end
    
    its(:feed) do
       should include(newer_recipes)
       should include(older_recipes)
       should_not include(unfollowed_recipes)
    end
      its(:feed) do
        followed_user.recipes.each do |recipe|
          should include(recipe)
        end
      end
    end

end
end
