class ContactsController < ApplicationController

  def index
    @contact = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      latitude: coordinates[0],
      longitude: coordinates[1],
      bio: params[:bio]
      )
    @contact.save
    redirect_to "/contacts/"
  end

  def show
    @contact = Contact.find_by(
      id: params[:id])
    render "show.html.erb"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.find_by(id: params[:id])
    @contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      latitude: coordinates[0],
      longitude: coordinates[1],
      bio: params[:bio]
      )
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render "destroy.html.erb"
  end

  def all_johns
    @johns = Contact.find_all_johns
    render "all_johns.html.erb"
  end

end
