class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	add_flash_types :danger, :info, :warning, :success
	include SessionsHelper
	before_action :logged_in?

	def current_shopping_cart
		if current_user
			@cart = @user.cart
		else
			if session[:shopping_cart]
				@cart = Cart.find(session[:cart])
			else
				@cart = Cart.create
				session[:cart] = @card.id
			end
		end
	end
end



module SessionsHelper
  
 def log_in(user)
    session[:user_id] = user.id
  end

 def current_user
   @current_user ||= User.find_by(id:session[:user_id])
 end

 def logged_in?
   #!current_user.nil?
    unless User.find_by(id: session[:user_id])
     redirect_to root_url, info:"Please log in"
   end
 end

 def admin?
 	unless @current_user && @current_user.admin
 		redirect_to root_url, warning: "Unauthorized access"
 	end
 end

 def log_out
   session.delete(:user_id)
   @current_user = nil
 end
end
