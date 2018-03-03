require 'test_helper'

class KitchensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kitchen = kitchens(:one)
  end

  test "should get index" do
    get kitchens_url, as: :json
    assert_response :success
  end

  test "should create kitchen" do
    assert_difference('Kitchen.count') do
      post kitchens_url, params: { kitchen: { latitude: @kitchen.latitude, longitude: @kitchen.longitude, name: @kitchen.name } }, as: :json
    end

    assert_response 201
  end

  test "should show kitchen" do
    get kitchen_url(@kitchen), as: :json
    assert_response :success
  end

  test "should update kitchen" do
    patch kitchen_url(@kitchen), params: { kitchen: { latitude: @kitchen.latitude, longitude: @kitchen.longitude, name: @kitchen.name } }, as: :json
    assert_response 200
  end

  test "should destroy kitchen" do
    assert_difference('Kitchen.count', -1) do
      delete kitchen_url(@kitchen), as: :json
    end

    assert_response 204
  end
end
