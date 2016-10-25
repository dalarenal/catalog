require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  def test_create
    create_list(:movie, 3)
    create_list(:season, 2, :with_episodes)

    get contents_url, as: :json

    assert_response :success
    assert_equal 5, JSON.parse(body).count
    assert_json_schema('contents', body)
  end
end
