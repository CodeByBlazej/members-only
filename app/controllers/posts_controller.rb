class PostsController < ApplicationController
  before_action :require_login, only: [ :new, :create ]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "you must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end

  def post_params
    params.expect(post: [ :title, :body ])
  end
end
