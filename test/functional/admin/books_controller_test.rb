require 'test_helper'

class Admin::BooksControllerTest < ActionController::TestCase
  setup do
    login_as(:admin_user)  
    @book = books(:cooking_for_friends_can_be_fun)
  end

  test "should not let normal users in" do
    login_as(:normal_user)
    get :index
    assert_redirected_to admin_login_path
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { description: @book.description, title: @book.title }
    end

    assert_redirected_to admin_book_path(assigns(:book))
  end

  test "should show admin_book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    put :update, id: @book, book: { description: @book.description, title: @book.title }
    assert_redirected_to admin_book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to admin_books_path
  end
end
