class CommentsController < ApplicationController
  before_action :logged_in_user, only: %i(create edit)
  before_action :load_comment, only: %i(edit update destroy)

  def create
    @comment = current_user.comments.build comments_params
    if @comment.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to @comment.book
  end

  def edit; end

  def update
    if @comment.update_attributes comments_params
      flash[:success] = t ".updated"
      redirect_to @comment.book
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to @comment.book
  end

  private

  def comments_params
    params.require(:comment).permit :book_id, :content
  end

  def load_comment
    @comment = current_user.comments.find_by id: params[:comment_id]
    return if @comment
    flash[:danger] = t ".load_fail"
    redirect_to root_path
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".load_fail"
    redirect_to books_path
  end
end
