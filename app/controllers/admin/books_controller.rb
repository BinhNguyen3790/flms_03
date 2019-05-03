class Admin::BooksController < ApplicationController
  before_action :load_book, only: %i(destroy edit update show)

  def index
    @books =
      Book.search_book(params[:search]).newest.paginate page: params[:page],
        per_page: Settings.book.per_page
    respond_to do |format|
      format.html
      format.csv{send_data Book.to_csv}
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".success"
      redirect_to admin_books_path
    else
      flash[:danger] = t ".danger"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @book.update_attributes book_params
      flash[:success] = t ".success"
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to admin_books_path
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".error"
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit :name, :author_id, :category_id, :publisher_id,
      :name, :image, :content, :year, :number_of_pages, :quantity
  end
end
