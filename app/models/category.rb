class Category < ActiveRecord::Base

  has_many :tutorials
  validates_presence_of :name
  before_destroy :check_tutorials
  
  def name=(value)
		self[:name] = value
		self[:url_friendly] = to_url_friendly(value)
  end
  
private 

	def to_url_friendly(value)
		new = value.downcase
		new = new.strip
		new = new.gsub(/[^0-9a-zA-Z ]/, '')
		new = new.gsub(/[ ]/, '_')
	end
  
  def check_tutorials    
    if tutorials.count > 0
      errors.add_to_base("Cannot delete category while associated tutorials exist")
      return false
    end
  end
  
end
