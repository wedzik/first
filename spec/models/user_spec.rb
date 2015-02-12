require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'model validations' do
    before(:each) do
      @user = User.new
    end

    it "should require email and password" do
      @user.email = nil
      expect(@user).to be_invalid
      expect(@user.errors[:email]).to_not be_empty
      expect(@user.errors[:password]).to_not be_empty
    end

    it "password shuld match confirmation" do
      @user.password = "111"
      @user.password_confirmation = "222"
      @user.valid?
      expect(@user.errors[:password]).to_not be_empty
    end

    it "age shuld be greater than 10" do
      @user.age = 9
      @user.valid?
      expect(@user.errors[:age]).to_not be_empty
      @user.age = 11
      @user.valid?
      expect(@user.errors[:age]).to be_empty
    end
  end
end
