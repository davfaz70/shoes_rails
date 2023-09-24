class ShoesColorsSizesController < ApplicationController
  before_action :set_shoes_colors_size, only: %i[ show update destroy ]

  # GET /shoes_colors_sizes
  def index
    @shoes_colors_sizes = ShoesColorsSize.all

    render json: @shoes_colors_sizes
  end

  # GET /shoes_colors_sizes/1
  def show
    render json: @shoes_colors_size
  end

  # POST /shoes_colors_sizes
  def create
    @shoes_colors_size = ShoesColorsSize.new(shoes_colors_size_params)

    if @shoes_colors_size.save
      render json: @shoes_colors_size, status: :created, location: @shoes_colors_size
    else
      render json: @shoes_colors_size.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shoes_colors_sizes/1
  def update
    if @shoes_colors_size.update(shoes_colors_size_params)
      render json: @shoes_colors_size
    else
      render json: @shoes_colors_size.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shoes_colors_sizes/1
  def destroy
    @shoes_colors_size.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoes_colors_size
      @shoes_colors_size = ShoesColorsSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shoes_colors_size_params
      params.require(:shoes_colors_size).permit(:shoe_id, :color_id, :size_id)
    end
end
