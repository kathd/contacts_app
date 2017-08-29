class ContactsController < ApplicationController

  def single_contact_method
    @contact = Contact.find(3)
    render "contact.html.erb"
  end

end
