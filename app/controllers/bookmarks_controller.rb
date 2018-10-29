class BookmarksController < ApplicationController

  def show
     @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end


  def edit
    @bookmark = Bookmark.find(params[:id])

  end

  def create
  @topic = Topic.find(params[:topic_id])
  @bookmark = @topic.bookmarks.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else
      flash[:error] = "Error saving Bookmark. Please try again."
      render :new
    end
 end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)


    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to @topic
    else
      flash[:error] = "Error saving Bookmark. Please try again."
      render :edit
    end
  end

  def destroy

     @bookmark = Bookmark.find(params[:id])

     if @bookmark.destroy
       flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the Bookmark."
       render :show
     end
   end

   def bookmark_params
     params.require(:bookmark).permit(:url)
   end
end
