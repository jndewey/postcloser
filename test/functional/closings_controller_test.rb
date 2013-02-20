require 'test_helper'

class ClosingsControllerTest < ActionController::TestCase
  setup do
    @closing = closings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:closings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create closing" do
    assert_difference('Closing.count') do
      post :create, closing: { content: @closing.content, name: @closing.name }
    end

    assert_redirected_to closing_path(assigns(:closing))
  end

  test "should show closing" do
    get :show, id: @closing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @closing
    assert_response :success
  end

  test "should update closing" do
    put :update, id: @closing, closing: { content: @closing.content, name: @closing.name }
    assert_redirected_to closing_path(assigns(:closing))
  end

  test "should destroy closing" do
    assert_difference('Closing.count', -1) do
      delete :destroy, id: @closing
    end

    assert_redirected_to closings_path
  end
end
