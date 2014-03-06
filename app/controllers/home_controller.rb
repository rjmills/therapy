class HomeController < ApplicationController
	def index
		@streams = []
		@twitch_users = User.where("twitch IS NOT NULL")
		@twitch_users.each do |user|
			stream = JSON.parse(open("https://api.twitch.tv/kraken/streams/#{user.twitch}").read)
			render :json => stream and return
		end
		@posts = NewsPost.limit(5).order("created_at DESC")
	end
end