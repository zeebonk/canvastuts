class YmereChange < ActiveRecord::Base

  def page_hash=(value)
    temp = Digest::SHA1.new << value
    self[:page_hash] = temp.to_s
  end
  
end