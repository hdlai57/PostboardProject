class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # binding.pry
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy 
      redirect_to root_path
    else
      redirect_to @post
    end
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    # add code to identify admin-user
    post.user = current_user
    # binding.pry
    if post.save!
      redirect_to posts_path
    else 
      render :new
    end

  end

  def readme
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [] )
  end

end
