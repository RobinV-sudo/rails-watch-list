class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # @bookmark = Bookmark.find(params[:bookmark_id])
    # list.bookmark = @bookmark
    if @list.save
      redirect_to list_path(@list)
    else
      render "lists/new", status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  # def update
    # @list = List.find(params[:id])
    # @list.update(list_params)
   # redirect_to list_path(@list)
  # end

  #def destroy
   # @list = List.find(params[:id])
   # @list.destroy
   # redirect_to list_path, status: :see_other
  #end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
