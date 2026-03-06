class UsersController < ApplicationController
  def show
    @users = current_user.added_users
    @groups = current_user.added_groups
  end
end
