class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find params[:id]
    @blogs = Blog.all.limit(5)
  end
end
