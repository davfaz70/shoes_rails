class ShoesCategoriesController < ApplicationController
  before_action :set_shoes_category, only: %i[ show update destroy ]

  # GET /shoes_categories
  def index
    @shoes_categories = ShoesCategory.all

    render json: @shoes_categories
  end

  # GET /shoes_categories/1
  def show
    render json: @shoes_category
  end

  # POST /shoes_categories
  def create
    @shoes_category = ShoesCategory.new(shoes_category_params)

    if @shoes_category.save
      render json: @shoes_category, status: :created, location: @shoes_category
    else
      render json: @shoes_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shoes_categories/1
  def update
    if @shoes_category.update(shoes_category_params)
      render json: @shoes_category
    else
      render json: @shoes_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shoes_categories/1
  def destroy
    @shoes_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoes_category
      @shoes_category = ShoesCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shoes_category_params
      params.require(:shoes_category).permit(:shoe_id, :category_id)
    end
end
