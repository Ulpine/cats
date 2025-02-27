class Article < ApplicationRecord
  before_save :structure_content
  paginates_per 10
  has_one_attached :image
  # Relations
  belongs_to :category
  has_many :article_products, dependent: :destroy
  has_many :products, through: :article_products

  # Validations
  validates :title, presence: true, length: { minimum: 5, maximum: 200 }
  validates :content, presence: true
  validates :slug, uniqueness: true
  validates :meta_description, length: { maximum: 160 }

  # Scopes
  scope :published, -> { where(published: true).order(published_at: :desc) }
  scope :by_category, ->(category_slug) { joins(:category).where(categories: { slug: category_slug }) }

  # Callbacks
  before_validation :generate_slug

  # Friendly URL generation
  def to_param
    slug
  end

  def display_content
    structured_content.presence || ArticleContentParser.parse(content)
  end

  def structure_content
    # Générez le contenu structuré
    self.structured_content = ArticleContentParser.parse(self.content)

    # Générez un résumé
    self.summary = ArticleContentParser.extract_summary(self.content)
  end

  private

  def generate_slug
    self.slug = title.parameterize if slug.blank?
  end
end
