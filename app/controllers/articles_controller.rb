class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show    
  end

  # GET /articles/new
  def new 
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit    
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)   
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update    
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    set_article # find the article
    @article.destroy                      # destroy the article
    redirect_to articles_path    # redirect to the article list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.expect(article: [ :title, :description ])

    end
end
