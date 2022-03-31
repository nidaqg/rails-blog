class CategoriesController < ApplicationController
    before_action :require_user, except: [:show, :index]

    def index
        @categories = Category.all
    end
    def new
        @category = Category.new
    end
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category successfully created"
            redirect_to categories_path
        else
            render "new"
        end
    end
    def show
        @category = Category.find(params[:id])
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end
  
    
end