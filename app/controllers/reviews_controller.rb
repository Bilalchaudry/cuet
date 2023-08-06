class ReviewsController < ApplicationController
  before_action :get_product, only: :create
  def new
  end

  def create
    review = @product.reviews.create!(review_params)
    render json: {data: review, status: :ok }
  end

  def index
  end

  private

  def get_product
    @product = Product.friendly.find(params[:review_data][:id].parameterize)
  end

  def review_params
    params.require(:review_data).permit(:name, :email, :rating, :comment)
  end
end
