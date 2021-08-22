require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { adress_id: @user.adress_id, date_birth: @user.date_birth, email: @user.email, gender: @user.gender, name: @user.name, photo: @user.photo, status: @user.status, telephone_1: @user.telephone_1, telephone_2: @user.telephone_2 } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { adress_id: @user.adress_id, date_birth: @user.date_birth, email: @user.email, gender: @user.gender, name: @user.name, photo: @user.photo, status: @user.status, telephone_1: @user.telephone_1, telephone_2: @user.telephone_2 } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
