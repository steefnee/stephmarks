class LikesController < ApplicationController
  def create
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Bookmark liked."
    else
      flash[:error] = "Liking failed"
    end

    redirect_to topic_path(@bookmark.topic)
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "Bookmark unliked."
    else
      flash[:error] = "Unliking failed."
    end

    redirect_to topic_path(@bookmark.topic)
  end

end
