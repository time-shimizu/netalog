class SubcategoriesController < ApplicationController
  def show
    @subcategory = Subcategory.find(params[:id])
    @microposts = @subcategory.microposts.order('created_at desc').page(params[:page]).per(5)
    @categories = Category.all
    render "microposts/index"
  end
end
