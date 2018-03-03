require 'test_helper'

class ReciptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipt = recipts(:one)
  end

  test "should get index" do
    get recipts_url, as: :json
    assert_response :success
  end

  test "should create recipt" do
    assert_difference('Recipt.count') do
      post recipts_url, params: { recipt: { link: @recipt.link, name: @recipt.name } }, as: :json
    end

    assert_response 201
  end

  test "should show recipt" do
    get recipt_url(@recipt), as: :json
    assert_response :success
  end

  test "should update recipt" do
    patch recipt_url(@recipt), params: { recipt: { link: @recipt.link, name: @recipt.name } }, as: :json
    assert_response 200
  end

  test "should destroy recipt" do
    assert_difference('Recipt.count', -1) do
      delete recipt_url(@recipt), as: :json
    end

    assert_response 204
  end
end
