class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_household_item
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json

  def index
    # Can access the attribute of householditem on the index page by creating an object
    @reviews = Review.all
    # @reviews = HouseholdItem.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @reviews = Review.all
  end

  # GET /reviews/new
  def new

    # Create a new review record for a household item
    @review = Review.new
    # @review.household_item = HouseholdItem.find(params[:household_item_id])
    
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    # To create an instance variable
    @review.household_item = @household_item
    # household_item = HouseholdItem.find(review_params[:household_item_id])
    # @reviews = HouseholdItem.reviews
    # @new_review.household_item = @household_item
    @review.user = current_user


    respond_to do |format|
      if @review.save
        format.html { redirect_to household_item_reviews_url(@household_item), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to household_item_reviews_url(@household_item), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment, :rating, :household_item_id)
    end

    def set_household_item
      @household_item = HouseholdItem.find(params[:household_item_id])
    end


end
