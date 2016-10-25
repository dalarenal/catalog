require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def test_create
    create_list(:movie, 3)

    get movies_url, as: :json

    assert_response :success
    assert_equal 3, JSON.parse(body).count
    assert_json_schema('movies', body)
  end
end
