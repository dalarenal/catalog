require 'test_helper'

class SeasonsControllerTest < ActionDispatch::IntegrationTest
  def test_create
    create_list(:season, 3, :with_episodes)

    get seasons_url, as: :json

    assert_response :success
    assert_equal 3, JSON.parse(body).count
    assert_json_schema('seasons', body)
  end
end
