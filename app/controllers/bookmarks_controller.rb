class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path, status: :see_other
  end

  # def edit
  #   @bookmark = Bookmark.find(params[:id])
  # end

  # def update
  #   @bookmark = Bookmark.find(params[:id])
  #   @bookmark.update(list_params)
  #   redirect_to bookmark_path(@bookmark)
  # end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
