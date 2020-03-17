class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  	def self.get_api_info
		nasa_api = "https://api.nasa.gov/planetary/apod?api_key=pSznbvZqweRw6UOjRQTbxpMaEFIIVpkAKGbxXdhw"
		request_to_nasa_api = Net::HTTP.get(URI(nasa_api))
		JSON.parse request_to_nasa_api
	end
end
