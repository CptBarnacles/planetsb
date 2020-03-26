class NasaApiController < ApplicationController
  skip_before_action :logged_in?, only: [:index]
  def index
  	@nasa_info = NasaApi.get_api_info
  end
end
