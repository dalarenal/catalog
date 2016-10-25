require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  def test_create
    episode = create(:episode)

    assert episode.valid?
  end

  def test_is_invalid_without_season
    episode = build(:episode, season: nil)

    refute episode.valid?
  end
end
