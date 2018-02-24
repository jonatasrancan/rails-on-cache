class BooksController < ApplicationController
  before_action :log_before_action, only: :action_cache_show
  after_action  :log_after_action, only: :action_cache_show

  caches_page :page_cache_show
  caches_action :action_cache_show

  def index
    @books = Book.all.limit(500).includes(:comments)
  end

  def show
    @book = Book.find(params[:id])
  end

  def fragment_cache_show
    @book = Book.find(params[:id])
  end

  def etag_show
    @book = Book.find(params[:id])

    fresh_when last_modified: @book.updated_at, etag: @book.cache_key
  end

  def action_cache_show
    @book = Book.find(params[:id])
  end

  def page_cache_show
    @book = Book.find(params[:id])
  end

  private

  def log_before_action
    Rails.logger.info "======================="
    Rails.logger.info "Executing before action"
    Rails.logger.info "======================="
  end

  def log_after_action
    Rails.logger.info "======================="
    Rails.logger.info "Executing after action"
    Rails.logger.info "======================="
  end
end
