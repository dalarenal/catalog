require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  def test_create
    season = create(:season)

    assert season.valid?
  end
end
