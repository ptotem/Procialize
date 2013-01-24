require 'test_helper'

class ModeratorViewControllerTest < ActionController::TestCase
  test "should get moderator" do
    get :moderator
    assert_response :success
  end

end
