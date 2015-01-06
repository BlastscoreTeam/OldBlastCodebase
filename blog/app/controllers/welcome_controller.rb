require 'rubygems'
require 'rottentomatoes'
include RottenTomatoes

class WelcomeController < ApplicationController
  def index

		# setup your API key
		Rotten.api_key = "6qsug3hsxr4mtem9ac9crwyx"
		Expedia.cid = 55505
		Expedia.api_key = 'ckc8tzs6t9cbnqmykxwep4xe'
		Expedia.shared_secret = 'KWUbMwWN'
		Expedia.locale = 'en_US'
		Expedia.currency_code = 'USD'
		Expedia.minor_rev = 13
		if(params.has_key?(:q))
			@rottenMovie = RottenMovie.find(:title => params[:q], :limit => 1)
			@jsonObj = JSON.parse(open("http://www.omdbapi.com/?i=&t="+URI.encode(params[:q])){ |x| x.read })
			@netRating = ((@rottenMovie.ratings.critics_score.to_f/10)+@jsonObj['imdbRating'].to_f)/2
		end
		
		if(params.has_key?(:hotelSearchName))
			# Instentiate api object
			api = Expedia::Api.new;

			
			# Method to search for a hotel. see http://developer.ean.com/docs/hotel-list/
			hotelQuery = api.get_list({:numberOfResults => 1,:propertyName => URI.encode(params[:hotelSearchName]),:destinationString => URI.encode(params[:hotelSearchDestination])}).body['HotelListResponse']['HotelList']['HotelSummary'].first;
			@hotelName = hotelQuery['name'];
			@hotelRating = hotelQuery['hotelRating'];
			#@list = @hotelRating.first;
			# execute this method to know if there is any exception
			#@hotelRating.exception? # false if success
		end
		
		if(params.has_key?(:newuser))
			@newUser = params[:newuser]
			user = BlastUser.new(username: params[:newuser])
			#user.friendArray = Array.new()
			user.save
		end
		
		if(params.has_key?(:user)&&params.has_key?(:movie)&&params.has_key?(:rating))
			u = BlastUser.find_by(username: params[:user])
			u.ratings.build({:movie => params[:movie], :rating => params[:rating], :review => params[:review]})
			u.save
		end
		
		if(params.has_key?(:viewuser))
			@allUserRatings = BlastUser.find_by(username: params[:viewuser]).ratings
		end
		
		if(params.has_key?(:curUser))
			u = BlastUser.find_by(username: params[:curUser])
			f = BlastUser.find_by(username: params[:friendUser])
			u.friendships.build({:username => params[:curUser], :friendname => params[:friendUser]})
			#u.friendArray << f.username
			u.save
		end
		
		if(params.has_key?(:userFriendSearch))
			u = BlastUser.find_by(username: params[:userFriendSearch])
			@friendRatings = Array.new
			for friendship in u.friendships
				BlastUser.find_by(username: friendship.friendname).ratings.each do |rate|
					r = Array.new
					r.push(friendship.friendname)
					r.push(rate.movie)
					r.push(rate.rating)
					r.push(rate.review)
					@friendRatings.push(r)
				end
			end
		end
		
	end
  
  def new
	
  end
end
