class NewsItem < ActiveRecord::Base
  
  belongs_to :administrator
  
  validates_presence_of :title, :content

	def title=(value)
		self[:title] = value
		self[:url_friendly] = to_url_friendly(value)
  end
	
private

	def to_url_friendly(value)
		new = value.downcase
		new = new.strip
		new = new.gsub(/[^0-9a-zA-Z ]/, '')
		new = new.gsub(/[ ]/, '_')
	end
	
end