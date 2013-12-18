require 'test_helper'

class NoirQuizzesControllerTest < ActionController::TestCase
  setup do
    @noir_quiz = noir_quizzes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:noir_quizzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create noir_quiz" do
    assert_difference('NoirQuiz.count') do
      post :create, noir_quiz: { noir_answer: @noir_quiz.noir_answer, noir_question: @noir_quiz.noir_question, user_id: @noir_quiz.user_id }
    end

    assert_redirected_to noir_quiz_path(assigns(:noir_quiz))
  end

  test "should show noir_quiz" do
    get :show, id: @noir_quiz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @noir_quiz
    assert_response :success
  end

  test "should update noir_quiz" do
    put :update, id: @noir_quiz, noir_quiz: { noir_answer: @noir_quiz.noir_answer, noir_question: @noir_quiz.noir_question, user_id: @noir_quiz.user_id }
    assert_redirected_to noir_quiz_path(assigns(:noir_quiz))
  end

  test "should destroy noir_quiz" do
    assert_difference('NoirQuiz.count', -1) do
      delete :destroy, id: @noir_quiz
    end

    assert_redirected_to noir_quizzes_path
  end
end
