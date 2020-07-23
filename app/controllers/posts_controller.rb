class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
    @post = Post.find(params[:id])
  end



  def edit #! in this case if the person tries to edit with wrong info im running checks
    @post = Post.find(params[:id])

  end

  def update
    #*@post.update(post_params) ( running checks once he updates)
    #*redirect_to post_path(@post)
    if @post.update(post_params)
      
    redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
