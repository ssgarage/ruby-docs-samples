require "test_helper"

class VotesTest < ActionDispatch::IntegrationTest
  test "can create a new vote" do
    get "/"
    assert_response :success

    post "/", params: { candidate: "TABS" }, as: :json
    p @response.params.inspect
    assert_response :success
    assert_select "p", "Title:\n  can create"
  end
end
