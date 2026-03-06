class ContactsController < ApplicationController
  before_action :set_contact, only: [:destroy]

  def create
    contact = User.find(params[:user_id])

    if already_contact?(contact)
      redirect_to user_contacts_path(current_user),
                  alert: "#{contact.email} is already in your contacts."
    else
      add_contact(contact)

      redirect_to user_contacts_path(current_user),
                  notice: "#{contact.email} was successfully added to your contacts."
    end
  end

  def destroy
    if already_contact?(@contact)
      remove_contact(@contact)

      redirect_to user_contacts_path(current_user),
                  notice: "#{@contact.email} was successfully removed from your contacts."
    else
      redirect_to user_contacts_path(current_user),
                  alert: "#{@contact.email} is not in your contacts."
    end
  end

  private

  def set_contact
    @contact = User.find(params[:id])
  end

  def already_contact?(user)
    current_user.added_users.exists?(user.id)
  end

  def add_contact(user)
    current_user.added_users << user unless already_contact?(user)
    user.added_users << current_user unless user.added_users.exists?(current_user.id)
  end

  def remove_contact(user)
    current_user.added_users.delete(user)
    user.added_users.delete(current_user)
  end
end
