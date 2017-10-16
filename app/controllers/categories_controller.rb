class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.order(:title)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} created!"
      redirect_to categories_path
    else
      @errors = @category.errors.full_messages
      redirect_to new_category_path
    end
  end

  def show
    @jobs = @category.jobs
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.title} updated!"
      redirect_to categories_path
    else
      render :edit
    end
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
