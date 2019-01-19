# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show autocomplete]
  before_action :get_post, only: %i[show edit update destroy]
  before_action :force_json, only: :autocomplete
  
  def index
    @posts = Post.do_search(params)
  end

  def autocomplete
    @posts = Post.search('title: ' + params[:query], :per_page => 5, boost: 1).results().map do |r|
      r = { :name => r.title, :url => '/posts/' + r.id }
    end
    @users = User.search('login: ' + params[:query], :per_page => 5, :boost => 1).results().map do |u|
      u = { :name => u.login, :url => '/users/' + u.id }
    end
    render json: {posts: @posts, users: @users}  
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to :root, success: 'Post has been removed'
  end

  def edit
    unless current_user.id == @post.user.id 
      unless current_user.admin
        redirect_to :root, danger: 'Access denied'
      end
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Post has been updated'
    else
      render :edit, danger: 'Post was not updated'
    end
  end

  def show
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Success'
    else
      render :new, danger: 'Post was not created'
    end
  end

  def show_comments(comments)
    unless comments.nil? 
      comments.map do |c|
        puts c.body.to_s
      end
    end
    return 
  end
  helper_method :show_comments
  private

  def force_json
    request.format = :json
  end

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :all_tags, :category_id, :user_id, :scope, :description)
  end
end
