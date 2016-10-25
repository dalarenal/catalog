require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def test_create
    movie = create(:movie)

    assert movie.valid?
  end
end
