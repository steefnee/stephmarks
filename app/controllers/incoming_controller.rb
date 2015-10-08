class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    #puts "INCOMING PARAMS HERE: #{params}"
    # You put the message-splitting and business
    # magic here.

    # Find the user by using params[:sender]
    # Find the topic by using params[:subject]
    # Assign the url to a variable after retreiving it from params["body-plain"]
    email = params[:sender]
    @user = User.where(email: email)

    url = params["body-plain"]

    # Check if user is nil, if so, create and save a new user
    if @user.nil?
      @user = User.create!(name: email, email: email, password: 'password')
    end

    # Check if the topic is nil, if so, create and save a new topic
    @topic = Topic.find_or_create_by(title: params[:subject].downcase)

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = @topic.bookmarks.build(url: url)
    @bookmark.user = @user

    if @bookmark.save
      head 200
    else
      head 404
    end



    # Assuming all went well.

  end
end
