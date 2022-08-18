class BookmarksController < ApplicationController
  def new
    @list = List.find([:list_id])
    @bookmark = Bookmark.new
  end

  def create
    list_id = params[:id]
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = list_id

    if @bookmark.save
      redirect_to list_path(list_id)
    else
      render :new, status: :unprocessable_entity
    end

    redirect_to bookmarks_list_path(@list)
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:list).permit(:movie, :comment)
  end
end
