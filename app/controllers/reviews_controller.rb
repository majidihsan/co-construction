class ReviewsController < ApplicationController

  def index
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @company = Company.find(params[:company_id])
    @review = Review.new(review_params)
    @review.company = @company
    @review.user = current_user
    if @review.save
      redirect_to dashboard_index_path, notice: "You have successfully submitted a Review."
    else
      redirect_to company_path(@company), alert: @review.errors.full_messages.join(', ')
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
