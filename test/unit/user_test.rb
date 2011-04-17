require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = Factory.create(:user)
  end

  test "should return a string" do
    assert_equal @user.email, @user.to_s
  end

  test "should set a flag if user created by dynamic finder" do
    user = User.find_or_create_by_email(@user.email) do |u|
      u.was_created = true
    end
    assert !user.was_created

    user = User.find_or_create_by_email('non_existent@example.com') do |u|
      u.was_created = true
    end
    assert user.was_created
  end

end
