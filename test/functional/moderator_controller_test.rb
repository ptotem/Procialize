require 'test_helper'

class ModeratorControllerTest < ActionController::TestCase
  test "should get moderator_view" do
    get :moderator_view
    assert_response :success
  end

end
