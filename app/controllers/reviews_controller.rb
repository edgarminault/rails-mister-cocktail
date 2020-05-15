class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @reviews = @cocktail.reviews
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @doses = @cocktail.doses
      @dose = Dose.new
      render 'cocktail/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @cocktail = @review.cocktail
    @review.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:content, :grade)
  end
end
