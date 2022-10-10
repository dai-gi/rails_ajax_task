class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ destroy ]
  before_action :set_blog

  def create
    @favorite = Favorite.create(user_id: current_user.id, blog_id: @blog.id)
    respond_to do |format|
      format.js { render :create }
    end
  end

  def destroy
    @favorite.destroy
    respond_to do |format|
      format.js { render :destroy }
    end
  end

  private
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
