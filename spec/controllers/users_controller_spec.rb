require 'spec_helper'

describe UsersController do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "username" => "MyString", "name" => "Mr. S", "password" => "test", "password_confirmation" => "test"} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { { "user.key" => session["user.key"]} }

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}#, valid_session
      assigns(:users).should eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}#, valid_session
      assigns(:user).should eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}#, valid_session
      assigns(:user).should be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => valid_attributes}, valid_session
        response.should redirect_to(User.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "username" => "invalid value" }}, valid_session
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "username" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do

    it "redirects to the sign in page" do
      user = User.create! valid_attributes
      delete :destroy, {:id => user.to_param}#, valid_session
      response.should redirect_to(signin_path)
    end
  end

end
