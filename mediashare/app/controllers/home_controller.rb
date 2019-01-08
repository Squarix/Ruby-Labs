# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.all	
    render 'index'
  end
end
