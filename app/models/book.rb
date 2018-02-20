class Book < ApplicationRecord
  has_many :comments

  def self.top_rated(limit)
    Book.joins(:comments)
      .select('books.id, books.updated_at, title, avg(comments.rate) as avg_rate')
      .group('books.id')
      .order('avg_rate desc')
      .limit(limit)
  end

  def comments_amount
    Rails.cache.fetch(['comments_amount', self]) do
      comments.size
    end
  end

  def rate
    Rails.cache.fetch(['rate', self]) do
      comments.sum(&:rate)/comments_amount
    end
  end
end
