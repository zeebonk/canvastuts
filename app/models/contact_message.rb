class ContactMessage < ActiveRecord::Base
	validates_presence_of :username, :email_address, :content
end
