require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  def test_create
    purchase = create(:purchase)

    assert purchase.valid?
  end

  def test_active_returns_current_purchases
    create(:purchase)
    create_list(:purchase, 3, expires_at: Time.current - 1.day)

    assert_equal 1, Purchase.active.count
  end

  def test_only_can_create_one_active
    valid_purchase = create(:purchase)
    invalid_purchase = build(
      :purchase,
      user_id: valid_purchase.user_id,
      purchase_option_id: valid_purchase.purchase_option_id
    )

    refute invalid_purchase.valid?
  end
end
