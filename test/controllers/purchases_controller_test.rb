require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  def test_index
    user = create(:user)
    create_list(:purchase, 2, :with_movie, user: user)
    create_list(:purchase, 3, :with_season, user: user)
    create_list(:purchase, 4, :with_movie, user: user, expires_at: Time.current - 1.day)

    get purchases_url, as: :json

    assert_response :success
    assert_equal 5, JSON.parse(body).count
    assert_json_schema('purchases', body)
  end

  def test_create
    create(:user)
    purchase_option = create(:purchase_option, content: create(:movie))

    assert_difference('Purchase.count', +1) do
      post purchase_option_purchases_url(purchase_option)
    end

    assert_response :created
    assert_json_schema('purchase', body)
  end

  def test_cannot_create_with_invalid_purchase_option
    user = create(:user)

    assert_raise(ActiveRecord::RecordNotFound) do
      post purchase_option_purchases_url(9999)
    end
  end

  def test_cannot_create_dup
    user = create(:user)
    purchase_option = create(:purchase_option, content: create(:movie))
    create(:purchase, purchase_option: purchase_option, user: user)

    assert_no_difference('Purchase.count') do
      post purchase_option_purchases_url(purchase_option)
    end

    assert_response :unprocessable_entity
  end

  def test_create_dup_if_is_expired
    user = create(:user)
    purchase_option = create(:purchase_option, content: create(:movie))
    create(:purchase, purchase_option: purchase_option, user: user, expires_at: Time.current - 1.day)

    assert_difference('Purchase.count', +1) do
      post purchase_option_purchases_url(purchase_option)
    end

    assert_response :created
    assert_json_schema('purchase', body)
  end
end
