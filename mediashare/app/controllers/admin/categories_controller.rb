# frozen_string_literal: true

class Admin::CategoriesController < ApplicationController
  before_action :get_category, only: %i[edit update destroy]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 2)
  end

  def new
    @category = Category.new
  end

  def destroy
    @category.destroy
    redirect_to home_path, success: 'Пост успешно удален'
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      redirect_to @category, success: 'Пост успешно обновлен'
    else
      render :edit, danger: 'Пост не был обновлен'
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, success: 'Пост успешно создан'
    else
      render :new, danger: 'Пост не был создан'
    end
  end

  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
