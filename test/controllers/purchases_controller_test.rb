require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  def test_create
    create(:user)
    purchase_option = create(:purchase_option, content: create(:movie))

    assert_difference('Purchase.count', +1) do
      post purchases_url(purchase: { purchase_option_id: purchase_option.id })
    end

    assert_response :created
    assert_json_schema('purchase', body)
  end

  def test_cannot_create_dup
    user = create(:user)
    purchase_option = create(:purchase_option, content: create(:movie))
    create(:purchase, purchase_option: purchase_option, user: user)

    assert_no_difference('Purchase.count') do
      post purchases_url(purchase: { purchase_option_id: purchase_option.id })
    end

    assert_response :unprocessable_entity
  end

  def test_create_dup_if_is_expired
    user = create(:user)
    purchase_option = create(:purchase_option, content: create(:movie))
    create(:purchase, purchase_option: purchase_option, user: user, expires_at: Time.current - 1.day)

    assert_difference('Purchase.count', +1) do
      post purchases_url(purchase: { purchase_option_id: purchase_option.id })
    end

    assert_response :created
    assert_json_schema('purchase', body)
  end
end
