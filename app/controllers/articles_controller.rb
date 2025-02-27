class ArticlesController < ApplicationController
  before_action :set_categories, only: [:index, :show]

  def index
    @articles = Article.published
                      .includes(:category, :products)
                      .page(params[:page])
    @categories = Category.all
  end

  def show
    @article = Article.find_by!(slug: params[:slug])
    @recommended_products = find_recommended_products(@article)
  end

  def by_category
    category = Category.find_by!(slug: params[:category_slug])
    @articles = category.articles.published.page(params[:page]).per(10)
    @categories = Category.all
    render :index
  end

  private

  def category
    Category.find_by!(slug: params[:category_slug])
  end

  def set_categories
    @categories = Category.all
  end

  def find_recommended_products(article)
    # Essaie d'abord de trouver les produits directement liés à l'article
    article.products.presence ||
    # Sinon, cherche les produits de la même catégorie
    Product.where(category: article.category).limit(4) ||
    # En dernier recours, retourne les produits mis en avant
    Product.where(featured: true).limit(4)
  end
end
