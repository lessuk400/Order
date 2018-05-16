require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test 'should get index' do
=======
  test "should get index" do
>>>>>>> 396c301... Wrodi pashe grobana forma
    get menus_index_url
    assert_response :success
  end

<<<<<<< HEAD
  test 'should get new' do
=======
  test "should get new" do
>>>>>>> 396c301... Wrodi pashe grobana forma
    get menus_new_url
    assert_response :success
  end

<<<<<<< HEAD
  test 'should get create' do
=======
  test "should get create" do
>>>>>>> 396c301... Wrodi pashe grobana forma
    get menus_create_url
    assert_response :success
  end

<<<<<<< HEAD
  test 'should get edit' do
    get menus_edit_url
    assert_response :success
  end
=======
  test "should get edit" do
    get menus_edit_url
    assert_response :success
  end

>>>>>>> 396c301... Wrodi pashe grobana forma
end
