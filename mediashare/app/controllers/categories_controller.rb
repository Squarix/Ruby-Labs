# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :get_category

  def show; end

  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
