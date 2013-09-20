require 'test_helper'

class ExhibitorUserImportsControllerTest < ActionController::TestCase
  setup do
    @exhibitor_user_import = exhibitor_user_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exhibitor_user_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exhibitor_user_import" do
    assert_difference('ExhibitorUserImport.count') do
      post :create, exhibitor_user_import: { exhibitor__user_details: @exhibitor_user_import.exhibitor__user_details }
    end

    assert_redirected_to exhibitor_user_import_path(assigns(:exhibitor_user_import))
  end

  test "should show exhibitor_user_import" do
    get :show, id: @exhibitor_user_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exhibitor_user_import
    assert_response :success
  end

  test "should update exhibitor_user_import" do
    put :update, id: @exhibitor_user_import, exhibitor_user_import: { exhibitor__user_details: @exhibitor_user_import.exhibitor__user_details }
    assert_redirected_to exhibitor_user_import_path(assigns(:exhibitor_user_import))
  end

  test "should destroy exhibitor_user_import" do
    assert_difference('ExhibitorUserImport.count', -1) do
      delete :destroy, id: @exhibitor_user_import
    end

    assert_redirected_to exhibitor_user_imports_path
  end
end
