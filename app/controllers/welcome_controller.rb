class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.search(params[:q], params[:page])
  end
end
