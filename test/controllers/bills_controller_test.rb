require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill" do
    assert_difference('Bill.count') do
      post :create, bill: { bill_date: @bill.bill_date, bill_no: @bill.bill_no, billable: @bill.billable, customer_id: @bill.customer_id, freight: @bill.freight, memo: @bill.memo, paid_date: @bill.paid_date }
    end

    assert_redirected_to bill_path(assigns(:bill))
  end

  test "should show bill" do
    get :show, id: @bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill
    assert_response :success
  end

  test "should update bill" do
    patch :update, id: @bill, bill: { bill_date: @bill.bill_date, bill_no: @bill.bill_no, billable: @bill.billable, customer_id: @bill.customer_id, freight: @bill.freight, memo: @bill.memo, paid_date: @bill.paid_date }
    assert_redirected_to bill_path(assigns(:bill))
  end

  test "should destroy bill" do
    assert_difference('Bill.count', -1) do
      delete :destroy, id: @bill
    end

    assert_redirected_to bills_path
  end
end
