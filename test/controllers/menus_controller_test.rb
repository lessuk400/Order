require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
<<<<<<< HEAD
  test 'should get index' do
=======
  test "should get index" do
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
  test 'should get index' do
>>>>>>> fe98bb6... Done with Ruboco
    get menus_index_url
    assert_response :success
  end

<<<<<<< HEAD
<<<<<<< HEAD
  test 'should get new' do
=======
  test "should get new" do
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
  test 'should get new' do
>>>>>>> fe98bb6... Done with Ruboco
    get menus_new_url
    assert_response :success
  end

<<<<<<< HEAD
<<<<<<< HEAD
  test 'should get create' do
=======
  test "should get create" do
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
  test 'should get create' do
>>>>>>> fe98bb6... Done with Ruboco
    get menus_create_url
    assert_response :success
  end

<<<<<<< HEAD
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
=======
  test 'should get edit' do
    get menus_edit_url
    assert_response :success
  end
>>>>>>> fe98bb6... Done with Ruboco
end
