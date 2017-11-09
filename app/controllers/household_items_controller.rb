class HouseholdItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_household_item, only: [:show, :edit, :update, :destroy]

  # GET /household_items
  # GET /household_items.json
  def index

    @household_items = HouseholdItem.all

      # Search Function
    if params[:search]
      # for non postgresql
        if @household_items = HouseholdItem.where("title iLIKE ? OR genre iLIKE ? OR city iLIKE ? OR state iLIKE ?  OR genre iLIKE ? ","%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      # for postgresql change the LIKE to iLIKE
      # byebug
      # where("title iLIKE ? OR genre iLIKE ? OR author iLIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
        else
          @message = "We can not find your request !" 
          @household_items = HouseholdItem.all
          # byebug
        end
    end

  end

  def my_listing
      @household_items = HouseholdItem.all
      @household_items = HouseholdItem.where(seller: current_user)
  end
  # GET /household_items/1
  # GET /household_items/1.json
  def show

    if @household_item.transport_cost_cents.present?
        transport = @household_item.transport_cost_cents.floor(2)
    else
        transport = 0
    end

    if @household_item.price_cents.present?
        price = @household_item.price_cents.floor(2)
    else
        price  = 0
    end

    @total_cost = (transport + price)
    @total_cost_cents = (transport + price) * 100

    @google_api_key_static = ENV.fetch('GOOGLE_STATIC_APIKEY')        
    @google_api_key_embed = ENV.fetch('GOOGLE_EMBED_APIKEY')     
          
  end

  # GET /household_items/new
  def new
    @household_item = HouseholdItem.new
  end

  # GET /household_items/1/edit
  def edit
  end

  # POST /household_items
  # POST /household_items.json
  def create
    @household_item = HouseholdItem.new(household_item_params)
    @household_item.seller = current_user
    respond_to do |format|
      if @household_item.save
        format.html { redirect_to @household_item, notice: 'Household item was successfully listed.' }
        format.json { render :show, status: :created, location: @household_item }
      else
        format.html { render :new }
        format.json { render json: @household_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /household_items/1
  # PATCH/PUT /household_items/1.json
  def update
    respond_to do |format|
      if @household_item.update(household_item_params)
        format.html { redirect_to @household_item, notice: 'Household item was successfully updated.' }
        format.json { render :show, status: :ok, location: @household_item }
      else
        format.html { render :edit }
        format.json { render json: @household_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /household_items/1
  # DELETE /household_items/1.json
  def destroy
    @household_item.destroy
    respond_to do |format|
      format.html { redirect_to household_items_url, notice: 'Household item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household_item
      @household_item = HouseholdItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def household_item_params
      params.require(:household_item).permit(:year_purchase, :description, :street_name, :postcode, :state, :country, :transport_cost_cents, :price_cents, :item_image, :title, :genre, :city)
    end

end
