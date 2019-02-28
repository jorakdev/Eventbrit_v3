class ChargesController < ApplicationController
  def show
    @all_u = User.all
    @event_id = params[:id].to_i
    @@event_id_to = @event_id
    @all_e = Event.all
  end

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    # puts current_user.id
    # puts customer.id
    # puts @@event_id_to

    @a = Attendance.create(user_id: current_user.id, event_id: @@event_id_to, strip_custumer_id: customer.id)


    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
