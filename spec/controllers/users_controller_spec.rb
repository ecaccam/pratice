require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe "Post create new user" do 
		it 'Test if the name is Empty' do
			post :create_user, params: { name: "" }
			json = JSON.parse(response.body)

			expect(json["status"]).to eql(false)
	    end
    end

	describe "Post create new user" do 
		it 'Test if the name is Unique' do
			post :create_user, params: { name: "d" }
			json = JSON.parse(response.body)

			expect(json["status"]).to eql(true)
	    end
    end
end
