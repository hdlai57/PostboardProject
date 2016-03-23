class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(cate_params)
    if category.save!
      redirect_to root_path
    else
      redirect_to new_category_path
    end
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  private 

  def cate_params
    params.require(:category).permit(:name)
  end

end
