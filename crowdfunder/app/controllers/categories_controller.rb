class CategoriesController < ApplicationController
  def show
    @category = Cateogry.find(params[:id])
  end
end
