Rails.application.routes.draw do
  get "/contact" => "contacts#single_contact_method"
end
