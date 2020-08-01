class AuthorSessionsController < ApplicationController
  # before_filter :zero_authors_or_authenticated, only: [:new, :create]
  # def zero_authors_or_authenticated
  #   unless Author.count == 0 || current_user
  #     redirect_to root_path
  #     return false
  #   end
  # end
  ## VERIFY WHATS WRONG UP HERE, this is supposed to go in authors_controller
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Logged in successfully')
    else
      flash.now.alert = 'Login failed'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
