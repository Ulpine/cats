class ArticleProduct < ApplicationRecord
  belongs_to :article
  belongs_to :product

  # Optional weighting for product recommendation relevance
  validates :relevance_score, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    allow_nil: true
  }
end
