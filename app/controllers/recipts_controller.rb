class ReciptsController < ApplicationController
  before_action :set_recipt, only: [:show, :update, :destroy]

  # GET /recipts
  def index
    @recipts = Recipt.all

    render json: @recipts
  end

  # GET /recipts/1
  def show
    render json: @recipt
  end

  # POST /recipts
  def create
    @recipt = Recipt.new(recipt_params)

    if @recipt.save
      render json: @recipt, status: :created, location: @recipt
    else
      render json: @recipt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipts/1
  def update
    if @recipt.update(recipt_params)
      render json: @recipt
    else
      render json: @recipt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipts/1
  def destroy
    @recipt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipt
      @recipt = Recipt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipt_params
      params.require(:recipt).permit(:name, :link)
    end
end
