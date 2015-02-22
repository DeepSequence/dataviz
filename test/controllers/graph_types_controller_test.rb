require 'test_helper'

class GraphTypesControllerTest < ActionController::TestCase
  setup do
    @graph_type = graph_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graph_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graph_type" do
    assert_difference('GraphType.count') do
      post :create, graph_type: { name: @graph_type.name }
    end

    assert_redirected_to graph_type_path(assigns(:graph_type))
  end

  test "should show graph_type" do
    get :show, id: @graph_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @graph_type
    assert_response :success
  end

  test "should update graph_type" do
    patch :update, id: @graph_type, graph_type: { name: @graph_type.name }
    assert_redirected_to graph_type_path(assigns(:graph_type))
  end

  test "should destroy graph_type" do
    assert_difference('GraphType.count', -1) do
      delete :destroy, id: @graph_type
    end

    assert_redirected_to graph_types_path
  end
end
