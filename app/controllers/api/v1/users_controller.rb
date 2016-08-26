class Api::V1::UsersController < ApplicationController
#include ActionController::MimeResponds
respond_to :json
before_action :find_user, only:[:show,:update, :destroy]
skip_before_action :authenticate_user!, only: [:index, :show, :create]
def index
	@users = User.all
	respond_with @users
end

def show
respond_with @user
end

def create
	@user = User.create(user_params)
	respond_with @user, location: url_for([:api, :v1, @user])
end

def update
	@user.update_attributes(user_params)
	respond_with @user
end

def destroy
	@user.destroy
	respond_with @destroy
end

private
def find_user
	@user = User.find(params[:id])
end
def user_params
	params.require(:user).permit(:name, :age, :email, :password)
end
end
