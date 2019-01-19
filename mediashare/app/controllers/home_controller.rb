# frozen_string_literal: true

class HomeController < ApplicationController
  after_action :render_home, except: %i[index]

  def index
    @posts = Post.all	
  end

  def top_rated
  	@posts = Post.order(created_at: :desc)
  end

  private

  def render_home
  	render 'index'
  end  
end
