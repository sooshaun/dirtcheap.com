class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile_sign_up, only: [:new]
  before_action :set_profile, only: [:show, :edit, :update]
  # GET /profiles
  # GET /profiles.json
  def index
    # @profiles = Profile.all
    # if @profile = Profile.where(user_id: current_user.id)  

    #  else
    #     redirect_to  household_items_path, notice: "This is not your profile. You are only allowed to view your own profile page."
    #  end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    
  if @profile.user_id != current_user.id
    redirect_to  household_items_path, notice: "This is not your profile. You are only allowed to view your own profile page."
 end

  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    # @profile = Profile.where(user_id: current_user.id)
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    # To have the user id from user.
    @profile.user = current_user
    # if profile_params[:privacy] == "1"
    #   @profile.privacy = true
    # else
    #   @profile.privacy = false
    # end
    if @profile.privacy == true
        respond_to do |format|
          if @profile.save
            format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
            format.json { render :show, status: :created, location: @profile }
          else
            format.html { render :new }
            format.json { render json: @profile.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:privacy]="Please acknowledge that you have read and acknowledged of the company privacy policy"
        render :new
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile.user = current_user
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bsb, :account_number, :privacy, :avatar, :mobile_number)
    end

    def set_profile_sign_up
      @profile = Profile.where(user_id: current_user.id)
    end
end
