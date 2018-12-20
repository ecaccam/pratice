class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def create_user
		response = { :status => false, :message => "Empty Name" }

		if !params[:name].empty?
			check_user  = User.where(:name => params[:name])
			create_user = User.create(:name => params[:name])

			if check_user.length > 1
				response[:message] = "Your name #{params[:name]} has already been entered #{check_user.length}"
			else
				response[:message]  = "User Created"
			end
			
			response[:status]   = true
			response[:username] = create_user
		end

		render :json => response
	end
end
