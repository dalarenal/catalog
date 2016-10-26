require 'test_helper'

class PurchaseOptionTest < ActiveSupport::TestCase
  def test_create
    purchase_option = create(:purchase_option)

    assert purchase_option.valid?
  end
end
