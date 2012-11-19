require 'test_helper'

class MeetingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
