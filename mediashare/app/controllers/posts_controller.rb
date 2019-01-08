# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :get_post, only: %i[show edit update destroy]
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to index_home_path, success: 'Пост успешно удален'
  end

  def edit; end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Пост успешно обновлен'
    else
      render :edit, danger: 'Пост не был обновлен'
    end
  end

  def show; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Пост успешно создан'
    else
      render :new, danger: 'Пост не был создан'
    end
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :all_tags, :category_id, :user_id, :scope, :description)
  end
end
