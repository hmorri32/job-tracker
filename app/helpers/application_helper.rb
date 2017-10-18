module ApplicationHelper
  def companies
    Company.order(:name)
  end

  def cities
    Job.order(:city)
       .distinct
       .pluck(:city)
  end

  def categories
    Category.order(:title)
  end
end
