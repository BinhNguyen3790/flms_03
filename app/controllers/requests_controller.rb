class RequestsController < ApplicationController
  before_action :logged_in_user, only: %i(show index)
  before_action :load_book, only: :show

  def show
    @request = @book.requests.build
  end

  def index
    @requests =
      Request.search_request(params[:search]).newest.paginate page: params[:page],
        per_page: Settings.request.per_page
  end

  def create
    @request = Request.new request_params
    if @request.save
      flash[:success] = t ".success"
      redirect_to books_path @book
    else
      flash[:danger] = t ".fail"
      redirect_to root_path
    end
  end

  private

  def request_params
    params.require(:request).permit :book_id, :quantity, :from_date, :to_date,
      :status, :user_id
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".load_fail"
    redirect_to books_path
  end
end
