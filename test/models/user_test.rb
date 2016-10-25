require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_create
    user = create(:user)

    assert user.valid?
  end
end
