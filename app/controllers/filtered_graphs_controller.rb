class FilteredGraphsController < ApplicationController
  before_action :set_filtered_graph, only: [:show, :edit, :update, :destroy]

  # GET /filtered_graphs
  # GET /filtered_graphs.json
  def index
    @filtered_graphs = FilteredGraph.all
  end

  # GET /filtered_graphs/1
  # GET /filtered_graphs/1.json
  def show
  end

  # GET /filtered_graphs/new
  def new
    @filtered_graph = FilteredGraph.new
  end

  # GET /filtered_graphs/1/edit
  def edit
  end

  # POST /filtered_graphs
  # POST /filtered_graphs.json
  def create
    @filtered_graph = FilteredGraph.new(filtered_graph_params)

    respond_to do |format|
      if @filtered_graph.save
        format.html { redirect_to @filtered_graph, notice: 'Filtered graph was successfully created.' }
        format.json { render :show, status: :created, location: @filtered_graph }
      else
        format.html { render :new }
        format.json { render json: @filtered_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filtered_graphs/1
  # PATCH/PUT /filtered_graphs/1.json
  def update
    respond_to do |format|
      if @filtered_graph.update(filtered_graph_params)
        format.html { redirect_to @filtered_graph, notice: 'Filtered graph was successfully updated.' }
        format.json { render :show, status: :ok, location: @filtered_graph }
      else
        format.html { render :edit }
        format.json { render json: @filtered_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filtered_graphs/1
  # DELETE /filtered_graphs/1.json
  def destroy
    @filtered_graph.destroy
    respond_to do |format|
      format.html { redirect_to filtered_graphs_url, notice: 'Filtered graph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filtered_graph
      @filtered_graph = FilteredGraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filtered_graph_params
      params.require(:filtered_graph).permit(:graph_type_id, :dataset_type_id)
    end
end
