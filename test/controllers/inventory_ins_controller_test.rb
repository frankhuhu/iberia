require 'test_helper'

class InventoryInsControllerTest < ActionController::TestCase
  setup do
    @inventory_in = inventory_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_in" do
    assert_difference('InventoryIn.count') do
      post :create, inventory_in: { content: @inventory_in.content, in_date: @inventory_in.in_date, invoice: @inventory_in.invoice, paid_date: @inventory_in.paid_date, po: @inventory_in.po, truck: @inventory_in.truck, vendor: @inventory_in.vendor }
    end

    assert_redirected_to inventory_in_path(assigns(:inventory_in))
  end

  test "should show inventory_in" do
    get :show, id: @inventory_in
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_in
    assert_response :success
  end

  test "should update inventory_in" do
    patch :update, id: @inventory_in, inventory_in: { content: @inventory_in.content, in_date: @inventory_in.in_date, invoice: @inventory_in.invoice, paid_date: @inventory_in.paid_date, po: @inventory_in.po, truck: @inventory_in.truck, vendor: @inventory_in.vendor }
    assert_redirected_to inventory_in_path(assigns(:inventory_in))
  end

  test "should destroy inventory_in" do
    assert_difference('InventoryIn.count', -1) do
      delete :destroy, id: @inventory_in
    end

    assert_redirected_to inventory_ins_path
  end
end
