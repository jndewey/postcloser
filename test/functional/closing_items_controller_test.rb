require 'test_helper'

class ClosingItemsControllerTest < ActionController::TestCase
  setup do
    @closing_item = closing_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:closing_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create closing_item" do
    assert_difference('ClosingItem.count') do
      post :create, closing_item: { author: @closing_item.author, files: @closing_item.files, notes: @closing_item.notes, tasks: @closing_item.tasks, title: @closing_item.title }
    end

    assert_redirected_to closing_item_path(assigns(:closing_item))
  end

  test "should show closing_item" do
    get :show, id: @closing_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @closing_item
    assert_response :success
  end

  test "should update closing_item" do
    put :update, id: @closing_item, closing_item: { author: @closing_item.author, files: @closing_item.files, notes: @closing_item.notes, tasks: @closing_item.tasks, title: @closing_item.title }
    assert_redirected_to closing_item_path(assigns(:closing_item))
  end

  test "should destroy closing_item" do
    assert_difference('ClosingItem.count', -1) do
      delete :destroy, id: @closing_item
    end

    assert_redirected_to closing_items_path
  end
end
