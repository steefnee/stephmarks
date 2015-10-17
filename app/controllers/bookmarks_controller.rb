class BookmarksController < ApplicationController
  before_action :set_topic
  before_action :set_bookmark, except:[:index, :new, :create]

  # GET /bookmarks
  def index
    @bookmarks = @topic.bookmarks
  end

  # GET /bookmarks/1
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create
    @bookmark = @topic.bookmarks.build(bookmark_params)


    if @bookmark.save
      redirect_to  @topic, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @topic, notice: 'Bookmark was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    redirect_to @topic, notice: 'Bookmark was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = @topic.bookmarks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bookmark_params
      params.require(:bookmark).permit(:url, :topic_id)
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end



end
