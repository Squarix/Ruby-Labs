class SearchController < ApplicationController
  def index
  	a = Post.search 'а'
  	render json: {posts: a, comments: ''}
  end
end
