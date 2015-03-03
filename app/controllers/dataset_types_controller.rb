class DatasetTypesController < ApplicationController
  before_action :authorize_admin
  before_action :set_dataset_type, only: [:show, :edit, :update, :destroy]
  
  # GET /dataset_types
  # GET /dataset_types.json
  def index
    @dataset_types = DatasetType.all
  end

  # GET /dataset_types/1
  # GET /dataset_types/1.json
  def show
  end

  # GET /dataset_types/new
  def new
    @dataset_type = DatasetType.new
  end

  # GET /dataset_types/1/edit
  def edit
  end

  # POST /dataset_types
  # POST /dataset_types.json
  def create
    @dataset_type = DatasetType.new(dataset_type_params)

    respond_to do |format|
      if @dataset_type.save
        format.html { redirect_to @dataset_type, notice: 'Dataset type was successfully created.' }
        format.json { render :show, status: :created, location: @dataset_type }
      else
        format.html { render :new }
        format.json { render json: @dataset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataset_types/1
  # PATCH/PUT /dataset_types/1.json
  def update
    respond_to do |format|
      if @dataset_type.update(dataset_type_params)
        format.html { redirect_to @dataset_type, notice: 'Dataset type was successfully updated.' }
        format.json { render :show, status: :ok, location: @dataset_type }
      else
        format.html { render :edit }
        format.json { render json: @dataset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_types/1
  # DELETE /dataset_types/1.json
  def destroy
    @dataset_type.destroy
    respond_to do |format|
      format.html { redirect_to dataset_types_url, notice: 'Dataset type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_type
      @dataset_type = DatasetType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_type_params
      params.require(:dataset_type).permit(:name, :num_cols, :format, :description, :image_file)
    end
end
