require 'test_helper'

class ExhibitorImportsControllerTest < ActionController::TestCase
  setup do
    @exhibitor_import = exhibitor_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exhibitor_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exhibitor_import" do
    assert_difference('ExhibitorImport.count') do
      post :create, exhibitor_import: { exhibitor_details: @exhibitor_import.exhibitor_details }
    end

    assert_redirected_to exhibitor_import_path(assigns(:exhibitor_import))
  end

  test "should show exhibitor_import" do
    get :show, id: @exhibitor_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exhibitor_import
    assert_response :success
  end

  test "should update exhibitor_import" do
    put :update, id: @exhibitor_import, exhibitor_import: { exhibitor_details: @exhibitor_import.exhibitor_details }
    assert_redirected_to exhibitor_import_path(assigns(:exhibitor_import))
  end

  test "should destroy exhibitor_import" do
    assert_difference('ExhibitorImport.count', -1) do
      delete :destroy, id: @exhibitor_import
    end

    assert_redirected_to exhibitor_imports_path
  end
end
