class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

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

  def post_params
    params.expect(post: [ :title, :body ])
  end
end
