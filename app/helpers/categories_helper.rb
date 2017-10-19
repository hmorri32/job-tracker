module CategoriesHelper
  def create_category(category)
    if category.save
      flash[:success] = "#{category.title} created!"
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  def update_category(category)
    if category.update(category_params)
      flash[:success] = "#{category.title} updated!"
      redirect_to categories_path
    else
      render :edit
    end
  end
end
