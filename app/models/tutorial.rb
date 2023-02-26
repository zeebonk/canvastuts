require 'mini_magick'

class Tutorial < ActiveRecord::Base

	belongs_to :administrator
  belongs_to :category
	
	validates_uniqueness_of :title, :url_friendly
	validates_presence_of  :image, :title, :description, :content, :url_friendly
	validate :validate_image
	
	def title=(value)
		self[:title] = value
		self[:url_friendly] = to_url_friendly(value)
  end
	
	def image=(value)
		begin
			filename = "#{Time.now.strftime("%d%m%Y%H%M%S")}#{Time.now.usec}.jpg"
			create_image(value.path, filename, "230x220", 100)
			self[:image] = filename
		rescue
			self[:image] = "bad_image"
		end
	end

private 

	def	create_image(image_path, filename, dimensions, quality)
		image = MiniMagick::Image::open(image_path)
		image.combine_options do |c|
			c.gravity "center"        # Force resize/crop around center
			c.resize dimensions + "^"	# Resize to fit with overlap
			c.extent dimensions       # Crop any overlap
			c.quality quality         # Set output quality
		end
		image.write("public/images/#{dimensions}/#{filename}")
	end

	def to_url_friendly(value)
		new = value.downcase
		new = new.strip
		new = new.gsub(/[^0-9a-zA-Z ]/, '')
		new = new.gsub(/[ ]/, '_')
	end
	
	def validate_image
		if image == "bad_image"
			errors.add(:image, "not supported.") 
			self[:image] = nil
		end
	end
  
end