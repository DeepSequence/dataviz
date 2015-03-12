require 'test_helper'

class FilteredGraphsControllerTest < ActionController::TestCase
  setup do
    @filtered_graph = filtered_graphs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filtered_graphs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filtered_graph" do
    assert_difference('FilteredGraph.count') do
      post :create, filtered_graph: { dataset_type_id: @filtered_graph.dataset_type_id, graph_type_id: @filtered_graph.graph_type_id }
    end

    assert_redirected_to filtered_graph_path(assigns(:filtered_graph))
  end

  test "should show filtered_graph" do
    get :show, id: @filtered_graph
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filtered_graph
    assert_response :success
  end

  test "should update filtered_graph" do
    patch :update, id: @filtered_graph, filtered_graph: { dataset_type_id: @filtered_graph.dataset_type_id, graph_type_id: @filtered_graph.graph_type_id }
    assert_redirected_to filtered_graph_path(assigns(:filtered_graph))
  end

  test "should destroy filtered_graph" do
    assert_difference('FilteredGraph.count', -1) do
      delete :destroy, id: @filtered_graph
    end

    assert_redirected_to filtered_graphs_path
  end
end
