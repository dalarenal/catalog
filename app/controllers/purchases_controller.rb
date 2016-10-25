class PurchasesController < ApplicationController
  def index
    @purchases = current_user.purchases.active.order(:expires_at)
  end

  def create
    @purchase = Purchase.new(
      purchase_params.merge(
        user_id: current_user.id,
        expires_at: Time.current + Purchase::EXPIRES_TIME_DEFAULT
      )
    )

    if @purchase.save
      render @purchase, formats: :json, status: :created
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:purchase_option_id)
  end
end
