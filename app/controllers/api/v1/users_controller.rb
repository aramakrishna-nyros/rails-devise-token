module Api::V1

  class UsersController < ApplicationController

  	require 'json'

  	def user_rigistration
  		if params.present?
  			new_user = User.create(email: params[:email], nickname: params[:firstname], name: params[:lastname], password: params[:password])
  			if new_user
  				render json: {status: "success", message: "User registered successfully"}
  			else
  				render json: {status: "fail", message: "User fail to registered"}
  			end
  		end
  	end

  	def logout
  		user = User.find(params[:id])
  		if user.present?
  			logout = user.update(tokens: nil)
  			if logout
  				render json: {status: "success", message: "User logout successfully"}
  			else
  				render json: {status: "fail", message: "User fail logout"}
  			end
  		end	
  	end
  
  end

end