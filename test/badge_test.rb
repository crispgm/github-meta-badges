require_relative "../src/badge"
require "minitest/autorun"
require "rack/test"

class BadgeTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Badge
  end

  def test_home
    get "/"
    follow_redirect!
    assert_equal "https://crispgm.github.io/github-meta-badges", last_request.url
  end

  def test_no_token_error
    get "/crispgm/github-meta-badges/stars.rb"
    assert_equal "No access token error.", last_request.env["sinatra.error"].to_s
    assert_equal 500, last_response.status
  end
end
