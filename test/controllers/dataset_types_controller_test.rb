require 'test_helper'

class DatasetTypesControllerTest < ActionController::TestCase
  setup do
    @dataset_type = dataset_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_type" do
    assert_difference('DatasetType.count') do
      post :create, dataset_type: { format: @dataset_type.format, name: @dataset_type.name, num_cols: @dataset_type.num_cols }
    end

    assert_redirected_to dataset_type_path(assigns(:dataset_type))
  end

  test "should show dataset_type" do
    get :show, id: @dataset_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataset_type
    assert_response :success
  end

  test "should update dataset_type" do
    patch :update, id: @dataset_type, dataset_type: { format: @dataset_type.format, name: @dataset_type.name, num_cols: @dataset_type.num_cols }
    assert_redirected_to dataset_type_path(assigns(:dataset_type))
  end

  test "should destroy dataset_type" do
    assert_difference('DatasetType.count', -1) do
      delete :destroy, id: @dataset_type
    end

    assert_redirected_to dataset_types_path
  end
end
