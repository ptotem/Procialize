require 'test_helper'

class QuestionablesControllerTest < ActionController::TestCase
  setup do
    @questionable = questionables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionable" do
    assert_difference('Questionable.count') do
      post :create, questionable: { approved: @questionable.approved, down_votes: @questionable.down_votes, event_id: @questionable.event_id, quest_name: @questionable.quest_name, up_votes: @questionable.up_votes, user_id: @questionable.user_id }
    end

    assert_redirected_to questionable_path(assigns(:questionable))
  end

  test "should show questionable" do
    get :show, id: @questionable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionable
    assert_response :success
  end

  test "should update questionable" do
    put :update, id: @questionable, questionable: { approved: @questionable.approved, down_votes: @questionable.down_votes, event_id: @questionable.event_id, quest_name: @questionable.quest_name, up_votes: @questionable.up_votes, user_id: @questionable.user_id }
    assert_redirected_to questionable_path(assigns(:questionable))
  end

  test "should destroy questionable" do
    assert_difference('Questionable.count', -1) do
      delete :destroy, id: @questionable
    end

    assert_redirected_to questionables_path
  end
end
