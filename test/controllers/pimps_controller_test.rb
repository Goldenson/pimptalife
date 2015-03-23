require 'test_helper'

class PimpsControllerTest < ActionController::TestCase
  setup do
    @pimp = pimps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pimps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pimp" do
    assert_difference('Pimp.count') do
      post :create, pimp: { image_id: @pimp.image_id, name: @pimp.name, user: @pimp.user }
    end

    assert_redirected_to pimp_path(assigns(:pimp))
  end

  test "should show pimp" do
    get :show, id: @pimp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pimp
    assert_response :success
  end

  test "should update pimp" do
    patch :update, id: @pimp, pimp: { image_id: @pimp.image_id, name: @pimp.name, user: @pimp.user }
    assert_redirected_to pimp_path(assigns(:pimp))
  end

  test "should destroy pimp" do
    assert_difference('Pimp.count', -1) do
      delete :destroy, id: @pimp
    end

    assert_redirected_to pimps_path
  end
end
