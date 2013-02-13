class DonationsController < ApplicationController
  def new
    @publishable_key = Rails.configuration.stripe[:publishable_key]
  end

  def create
    @dollar_amount = amount = 0
    if params[:amount] =~ /^\$?(\d*)\.?(\d{0,2}).*/
      dollars, cents = $1, $2
      dollars = "0" if dollars == ""
      cents = "00" if cents == ""
      cents += "0" if cents.length == 1
      amount = (dollars.to_i * 100) + cents.to_i
      @dollar_amount = dollars + "." + cents
    end

    token = params[:stripeToken]
    name = params[:name]
    company = params[:company]
    description = params[:description]

    charge = Stripe::Charge.create(:amount => amount, :card => token, :description => "#{company}: #{description}", :currency => 'usd')

    if charge
      Donation.create(:name => name, :company => company, :amount => amount, :description => description)
    end

  rescue Stripe::CardError => e
    flash[:error] = "We're sorry, there was an error with your Credit Card"
    errcode = e.json_body[:error][:code]
    if errcode == "card_declined"
      flash[:error] = "We're sorry, your Credit Card was declined"
    end
    redirect_to new_donation_path
  rescue Stripe::InvalidRequestError => e
    flash[:error] = "We're sorry, there was a problem with your payment request"
    if amount < 50
      flash[:error] = "Sorry, donation amounts must be at least $0.50"
    end
    redirect_to new_donation_path
    return
  end
end
