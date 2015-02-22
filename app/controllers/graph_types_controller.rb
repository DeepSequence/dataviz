class GraphTypesController < ApplicationController
  before_action :set_graph_type, only: [:show, :edit, :update, :destroy]

  # GET /graph_types
  # GET /graph_types.json
  def index
    @graph_types = GraphType.all
  end

  # GET /graph_types/1
  # GET /graph_types/1.json
  def show
  end

  # GET /graph_types/new
  def new
    @graph_type = GraphType.new
  end

  # GET /graph_types/1/edit
  def edit
  end

  # POST /graph_types
  # POST /graph_types.json
  def create
    @graph_type = GraphType.new(graph_type_params)

    respond_to do |format|
      if @graph_type.save
        format.html { redirect_to @graph_type, notice: 'Graph type was successfully created.' }
        format.json { render :show, status: :created, location: @graph_type }
      else
        format.html { render :new }
        format.json { render json: @graph_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graph_types/1
  # PATCH/PUT /graph_types/1.json
  def update
    respond_to do |format|
      if @graph_type.update(graph_type_params)
        format.html { redirect_to @graph_type, notice: 'Graph type was successfully updated.' }
        format.json { render :show, status: :ok, location: @graph_type }
      else
        format.html { render :edit }
        format.json { render json: @graph_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graph_types/1
  # DELETE /graph_types/1.json
  def destroy
    @graph_type.destroy
    respond_to do |format|
      format.html { redirect_to graph_types_url, notice: 'Graph type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graph_type
      @graph_type = GraphType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graph_type_params
      params.require(:graph_type).permit(:name)
    end
end
