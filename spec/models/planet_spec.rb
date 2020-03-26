require 'rails_helper'

RSpec.describe User, type: :model do 
	context 'validates correctly' do 
		it 'ensures email presence' do
			user = User.new(email: 'example@example.com').save
			expect(user).to eq(false)
		end

		it 'ensures password is present' do
			params = double(:params, password: 'password', password_confirmation: 'password')
		end
	end

	context 'scope test' do
	end

end