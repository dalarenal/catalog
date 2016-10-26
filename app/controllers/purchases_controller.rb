class PurchasesController < ApplicationController
  def index
    @purchases = current_user.purchases.active.order(:expires_at)
  end

  def create
    purchase_option = PurchaseOption.find_by_id!(params[:purchase_option_id])

    @purchase = Purchase.new(
      purchase_option: purchase_option,
      user: current_user,
      expires_at: Time.current + Purchase::EXPIRES_TIME_DEFAULT
    )

    if @purchase.save
      render @purchase, formats: :json, status: :created
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end
end
