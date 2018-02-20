class Book < ApplicationRecord
  has_many :comments

  def comments_amount
    Rails.cache.fetch([self, 'comments_amount']) do
      comments.size
    end
  end

  def rate
    Rails.cache.fetch([self, 'rate']) do
      comments.sum(&:rate)/comments_amount
    end
  end
end
