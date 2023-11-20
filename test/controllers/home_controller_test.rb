require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  

  test "index action should set necessary instance variables" do
    get root_url
    assert_response :success

    assert_not_nil assigns(:url)
    assert_not_nil assigns(:uri)
    assert_not_nil assigns(:response)
    assert_not_nil assigns(:output)
    assert_not_nil assigns(:final_output)
    assert_not_nil assigns(:api_colour)
    assert_not_nil assigns(:message)
  end

  test "should pass search params when form is submitted" do
    post zipcode_path, params: { zipcode: 'value'}

    assert_response :success
    # Add more assertions based on your specific requirements
    # For example, check if the instance variables are set, or if the record is created in the database.
  end

  # Add more specific tests for the conditions and logic in your controller action
  test "index action should handle different API response scenarios" do
    # Test the case where @output is empty
    # Test each condition in your logic (e.g., @final_output <= 50, @final_output >=51 && @final_output <= 100, etc.)
    # Ensure that the corresponding instance variables are set correctly based on different scenarios
  end
end
