class ContactsController < ApplicationController
  def index
    @users = current_user.added_users
    @groups = current_user.added_groups
  end

  def create

  end

  def destroy

  end
end
