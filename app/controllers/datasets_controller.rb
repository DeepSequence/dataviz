class DatasetsController < ApplicationController
  before_action :authorize_admin, only: [:index]
  before_action :set_dataset, only: [:show, :edit, :update, :destroy]

  # GET /datasets
  # GET /datasets.json
  def index
    @datasets = Dataset.all
  end

  def browse
    @datasets = Dataset.all
  end

  # GET /datasets/1
  # GET /datasets/1.json
  def show
  end

  # GET /datasets/new
  def new
    @dataset = Dataset.new
  end

  # GET /datasets/1/edit
  def edit
    if @dataset.user != current_user
      redirect_to root_url, notice: "Must own graph to edit"
    end
  end

  # POST /datasets
  # POST /datasets.json
  def create
    @dataset = Dataset.new(dataset_params)
    @dataset.user = current_user

    respond_to do |format|
      if @dataset.save
        format.html { redirect_to @dataset, notice: 'Dataset was successfully created.' }
        format.json { render :show, status: :created, location: @dataset }
      else
        format.html { render :new }
        format.json { render json: @dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasets/1
  # PATCH/PUT /datasets/1.json
  def update
    if (@dataset.user != current_user) && !is_admin?
      redirect_to root_url, notice: "Must own graph to edit"
    else
      respond_to do |format|
        if @dataset.update(dataset_params)
          format.html { redirect_to @dataset, notice: 'Dataset was successfully updated.' }
          format.json { render :show, status: :ok, location: @dataset }
        else
          format.html { render :edit }
          format.json { render json: @dataset.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /datasets/1
  # DELETE /datasets/1.json
  def destroy
    if (@dataset.user != current_user) && !is_admin?
      redirect_to root_url, notice: "Must own graph to edit"
    else
      @dataset.destroy
      respond_to do |format|
        format.html { redirect_to datasets_url, notice: 'Dataset was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset
      @dataset = Dataset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_params
      params.require(:dataset).permit(:name, :file_name, :dataset_type_id, :data_file, :description)
    end
end
