class Contact < ApplicationRecord
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")

  end

  def japan_phone_number
    "+81 #{phone_number}"
  end

  def self.find_all_johns
    Contact.where(first_name: "John")
    
  end


end
