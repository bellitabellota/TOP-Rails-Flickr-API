require "flickr"

class StaticPagesController < ApplicationController
  def index
    unless params[:user_id].nil?
      flickr = Flickr.new(
        Rails.application.credentials.flickr_api_key,
        Rails.application.credentials.flickr_secret
      )
      @photos = flickr.photos.search(user_id: params[:user_id]).to_a

      ## Option 2 with method from flickr gem
      # @photo_urls = []

      # @photos.each do |photo|
      #   @info = flickr.photos.getInfo(photo_id: photo.id)
      #   @photo_urls.push(Flickr.url_b(@info))
      # end
    end
  end
end
