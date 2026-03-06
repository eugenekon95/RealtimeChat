class ContactButtonComponent < ViewComponent::Base
  def initialize(user:, current_user:)
    @user = user
    @current_user = current_user
  end

  def added?
    @current_user.added_users.exists?(id: @user.id)
  end

  def path
    added? ? helpers.user_contact_path(@current_user, @user) : helpers.user_contacts_path(@user)
  end

  def http_method
    added? ? :delete : :post
  end

  def icon
    added? ? "fa-trash-can" : "fa-square-plus"
  end

  def text
    added? ? "Remove contact" : "Add contact"
  end

  def button_class
    "rounded-lg py-2 px-2 pr-3 bg-blue-600 text-white inline-block font-medium cursor-pointer"
  end
end
