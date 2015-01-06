require 'test_helper'

class TruckingsControllerTest < ActionController::TestCase
  setup do
    @trucking = truckings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:truckings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trucking" do
    assert_difference('Trucking.count') do
      post :create, trucking: { commodity: @trucking.commodity, order_date: @trucking.order_date, pol: @trucking.pol, received_date: @trucking.received_date, remarks: @trucking.remarks, truck_po: @trucking.truck_po, trucker: @trucking.trucker, vendor: @trucking.vendor, vendor_po: @trucking.vendor_po }
    end

    assert_redirected_to trucking_path(assigns(:trucking))
  end

  test "should show trucking" do
    get :show, id: @trucking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trucking
    assert_response :success
  end

  test "should update trucking" do
    patch :update, id: @trucking, trucking: { commodity: @trucking.commodity, order_date: @trucking.order_date, pol: @trucking.pol, received_date: @trucking.received_date, remarks: @trucking.remarks, truck_po: @trucking.truck_po, trucker: @trucking.trucker, vendor: @trucking.vendor, vendor_po: @trucking.vendor_po }
    assert_redirected_to trucking_path(assigns(:trucking))
  end

  test "should destroy trucking" do
    assert_difference('Trucking.count', -1) do
      delete :destroy, id: @trucking
    end

    assert_redirected_to truckings_path
  end
end
