class GraphsController < ApplicationController
  before_action :set_graph, only: [:show, :edit, :update, :destroy, :show_simple]

  # GET /graphs
  # GET /graphs.json
  def index
    @graphs = Graph.all
  end

  def short_list
    if params[:type]
      graph_type = GraphType.find_by(name: params[:type])
      @graphs = Graph.where(graph_type_id: graph_type.id)
    else
       @graphs = Graph.all
    end
    render :short_list, :layout => false
  end

  # GET /graphs/1
  # GET /graphs/1.json
  def show
  end

  def show_simple
    render :show, :layout => false
  end

  # GET /graphs/new
  def new
    @graph = Graph.new
    @graph.dataset_id = params[:dataset_id]
  end

  # GET /graphs/1/edit
  def edit
    if @graph.user != current_user
      redirect_to root_url, notice: 'Cannot edit other users graphs'
    end
  end

  # POST /graphs
  # POST /graphs.json
  def create
    @graph = Graph.new(graph_params)
    @graph.user = current_user
    respond_to do |format|
      if @graph.save

        format.html { redirect_to @graph, notice: 'Graph was successfully created.' }
        format.json { render :show, status: :created, location: @graph }
      else
        format.html { render :new }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graphs/1
  # PATCH/PUT /graphs/1.json
  def update
    respond_to do |format|
      if (@graph.user == current_user) && @graph.update(graph_params)
        format.html { redirect_to @graph, notice: 'Graph was successfully updated.' }
        format.json { render :show, status: :ok, location: @graph }
      else
        format.html { render :edit }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graphs/1
  # DELETE /graphs/1.json
  def destroy
    if @graph.user == current_user
      @graph.destroy
      respond_to do |format|     
        format.html { redirect_to graphs_url, notice: 'Graph was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|     
        format.html { redirect_to graphs_url, notice: "You don't have the permission to delete this graph." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graph
      @graph = Graph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graph_params
      params.require(:graph).permit(:name, :dataset_id, :graph_type_id, :x_axis_label, :y_axis_label, :type)
    end
end
