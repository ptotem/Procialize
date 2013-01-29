require 'test_helper'

class SpeakerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
