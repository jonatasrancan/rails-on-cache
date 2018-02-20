class Comment < ApplicationRecord
  belongs_to :book, touch: true
end
