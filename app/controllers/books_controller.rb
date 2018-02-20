class BooksController < ApplicationController
  def index
    @books = Book.all.limit(500).includes(:comments)
  end

  def show
    @book = Book.find(params[:id])

    if params[:etag]
      fresh_when last_modified: @book.updated_at, etag: @book.cache_key
    end
  end
end
