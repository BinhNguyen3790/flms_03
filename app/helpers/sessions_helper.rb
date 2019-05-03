module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user? user
    user == current_user
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
  end

  def redirect_back_or default
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def request_status
    Request.statuses.keys.map{|status| [t("request_status.#{status}"), status]}
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def requests_newest
    current_user.requests.newest
  end

  def like? book
    current_user.likes.find_by(book_id: book.id).present?
  end

  def comment? comment
    current_user.comments.find_by(id: comment.id).present?
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".login"
    redirect_to login_url
  end

  def get_users _name
    User.alphabet
  end

  def get_books _name
    Book.alphabet
  end

  def get_requests _name
    Request.alphabet
  end

  def get_authors _name
    Author.alphabet
  end

  def get_categories _name
    Category.alphabet
  end

  def get_publishers _name
    Publisher.alphabet
  end
end
