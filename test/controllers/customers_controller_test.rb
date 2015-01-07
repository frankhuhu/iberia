require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address1: @customer.address1, address2: @customer.address2, address3: @customer.address3, address4: @customer.address4, address5: @customer.address5, company: @customer.company, email: @customer.email, contact: @customer.contact, customer_id: @customer.customer_id, phone: @customer.phone }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address1: @customer.address1, address2: @customer.address2, address3: @customer.address3, address4: @customer.address4, address5: @customer.address5, company: @customer.company, email: @customer.email, contact: @customer.contact, customer_id: @customer.customer_id, phone: @customer.phone }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
