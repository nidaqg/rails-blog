class ArticlesController < ApplicationController
    # this helper will run the method set_article before any of the code in the mentioned methods is run
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    #to display the article corresponding to the id in the url
    def show
    end
    #main page that displays all the articles
    def index
        @articles = Article.all
    end
    #page where new article gets created and saved to a variable. initialize the 
    # variable so if it errors out and relouds theres no error on page
    def new
        @article = Article.new
    end
    # page for editing article
    def edit
    end
    #create method to save created article to db, redirect to diff page
    def create
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
        flash[:notice] = "Article was created successfully."
      redirect_to @article
      else
        render 'new'
      end
    end
    # update exisitng article in db
    def update
         if @article.update(article_params)
         flash[:notice] = "Article was updated successfully!"
         redirect_to @article
        else
            render 'edit'
         end
    end
    #delete article
    def destroy
        @article.destroy
        redirect_to articles_path
    end

    #anything put inside the private block will only be avalible to this controller, not outside it
    private
    def set_article
    @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end
    def require_same_user
      if  current_user != @article.user
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to @article
      end
    end

end