require "test_helper"

class VotesTest < ActionDispatch::IntegrationTest
  setup do
    load "#{Rails.root}/db/seeds.rb"
  end

  test "can create a new vote" do
    p ENV["RAILS_ENV"]
    get "/"
    assert_response :success

    post "/", params: { candidate: "TABS" }
    assert_response :success
    assert_select "p", "Vote successfully cast for \"TABS\" at #{Vote.last(1).last.time_cast} PST!"

    post "/", params: { candidate: "SPACES" }
    assert_response :success
    assert_select "p", "Vote successfully cast for \"SPACES\" at #{Vote.last(1).last.time_cast} PST!"
  end
end
