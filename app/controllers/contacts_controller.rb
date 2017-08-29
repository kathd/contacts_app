class ContactsController < ApplicationController

  def single_contact_method
    @contact = Contact.first
    render "contact.html.erb"
  end

end
