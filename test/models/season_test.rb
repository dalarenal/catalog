require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  def test_create
    season = create(:season)

    assert season.valid?
  end

  def test_create_with_episodes
    season = create(:season, :with_episodes)

    assert season.episodes.size > 0
  end
end
