require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "Username",
      :name => "Name",
      :picture => "Picture",
      :interests => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should match(/Name/)
    rendered.should match(/Picture/)
    rendered.should match(/MyText/)
  end
end
