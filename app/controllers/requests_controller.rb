class RequestsController < ApplicationController
  before_action :logged_in_user, :search_book, only: %i(show index create edit)
  before_action :load_book, only: :show
  before_action :load_request, only: %i(destroy edit update)

  def show
    @request = @book.requests.build
  end

  def index
    @requests = Request.newest.paginate page: params[:page],
      per_page: Settings.request.per_page
  end

  def create
    @request = Request.new request_params
    @request = current_user.requests.build request_params
    if @request.save
      flash[:success] = t ".success"
      redirect_to requests_path
    else
      flash[:danger] = t ".fail"
      redirect_to root_path
    end
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = t ".updated"
      redirect_to requests_path
    else
      render :edit
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".error"
    end
    redirect_to requests_path
  end

  def edit; end

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

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    flash[:danger] = t ".load_fail"
    redirect_to requests_path
  end
end
