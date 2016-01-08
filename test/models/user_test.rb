require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def john_doe_user(first_name: 'John', last_name: 'Doe', email: 'john.doe@gopex.be', password: 'password', password_confirmation: 'password')
    User.new(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation)
  end

  test "create user" do
    user = john_doe_user
    assert user.save
    assert User.find(user.id)
  end

  test "user email uniqueness" do
    john_doe_user.save
    user2 = john_doe_user(first_name: 'Jane')
    assert_not user2.save
    assert user2.errors[:email]
  end

  test "user password and password confirmation match test" do
    user = john_doe_user(password_confirmation: 'not_matching')
    assert_not user.save
    assert user.errors[:password_confirmation]
  end

  test "user first_name required field" do
    assert_required_field john_doe_user, :first_name
  end

  test "user last_name required field" do
    assert_required_field john_doe_user, :last_name
  end

  test "user email required field" do
    assert_required_field john_doe_user, :email
  end

  test "user full_name method" do
    assert_equal "John Doe", john_doe_user.full_name
  end

  test "user associations" do
    user = john_doe_user
    assert user.wines
    assert user.tastings
  end

end
