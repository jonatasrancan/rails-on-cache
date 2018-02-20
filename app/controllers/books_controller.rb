class BooksController < ApplicationController
  def index
    @books = Book.all.limit(500).includes(:comments)
  end

  def show
    @book = Book.find(params[:id])
  end
end
