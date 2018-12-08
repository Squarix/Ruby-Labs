class OauthController < ApplicationController
  def index
  	@users = User.all
  end
end