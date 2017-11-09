class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
      @payments = Payment.where(user: current_user)
  end

  def show
   
  end

  def new
     # Create a new payment record for a household item
    @payment = Payment.new
    @aaa = HouseholdItem.find(params[:household_item_id])
    @payment.household_item = @aaa
  end


  def create
    payment_params = params.require(:payment).permit(:household_item_id)  #<== can add into the bracket  :discount if you have set it as a attribute.
    #Nre rental to save to database

    household_item = HouseholdItem.find(payment_params[:household_item_id])
    amount = household_item.price_cents + household_item.transport_cost_cents

    # Stripe matter
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (amount*100).to_i,
      :description => household_item.title,
      :currency    => 'aud'
    )

    payment = Payment.new
    # The video_id comes from the form (hidden_tag :video_id)
    payment.household_item = household_item
    payment.user = current_user  # always set this as a default

    #stripe handle the refund purpose through the charge_identifier by looking up the identifier. 
    payment.charge_identifier = charge.id
    payment.save
    redirect_to payments_path

    rescue Stripe::CardError => e # error interacts with new.thml.erb
    flash[:error] = e.message
    redirect_to new_payment_path(household_item_id: payment.household_item.id)
  end

end