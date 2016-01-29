class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post was created successfully"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Unable to process post"
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post was successfully updated"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Unable to update post"
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @post.destroy
    flash[:danger] = "Post has been destroyed"
    redirect_to posts_path
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to :back
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by current_user
    redirect_to :back
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :link)
    end

    def require_same_user
      if current_user != @post.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end
end
