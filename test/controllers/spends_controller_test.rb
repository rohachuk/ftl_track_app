require "test_helper"

class SpendsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # test "the truth" do
  #   assert true
  # end
  test "get index" do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in users(:bob)
    get :index
    assert_response :ok
  end
end
