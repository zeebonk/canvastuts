class Comment < ActiveRecord::Base
  belongs_to :tutorial
  validates_presence_of :username, :email_address, :content
end