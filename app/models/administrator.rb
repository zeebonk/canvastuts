class Administrator < ActiveRecord::Base

  validates_uniqueness_of   :username
  validates_presence_of     :username, :password
  validates_confirmation_of :password

	has_many :tutorials
  has_many :news_items
	
	def password=(value)
		self[:password]	= value.blank? ? "" : Administrator.sha1_with_salt(value)
  end
  
  def self.authenticate(username, password)
    Administrator.find_by_username_and_password(username, Administrator.sha1_with_salt(password))
  end
	
	def password_confirmation=(value)
		@password_confirmation = value.blank? ? "" : Administrator.sha1_with_salt(value)
  end
	
private
	
	def self.sha1_with_salt(value)
    Digest::SHA1.hexdigest("List of off-season Atlantic hurricanes" + value + "Spook the horse E.P.")
  end

end