class CategoriesController < ApplicationController
  include CategoriesHelper
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.order(:title)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    create_category(@category)
  end

  def show
    @jobs = @category.jobs
  end

  def edit
  end

  def update
    update_category(@category)
  end

  def destroy
    @category.delete
    flash[:success] = "#{@category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
