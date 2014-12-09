class Asset < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :user
  attr_accessible :user_id, :uploaded_file
  attr_accessible :user_id, :uploaded_file, :folder_id
  belongs_to :folder

#set up "uploaded_file" field as attached_file (using Paperclip)
  has_attached_file :uploaded_file,{
  :path => "assets/:id/:basename.:extension"
}.merge(PAPERCLIP_STORAGE_OPTIONS)


validates_attachment_size :uploaded_file, :less_than => 10.megabytes
validates_attachment_presence :uploaded_file
  def file_name
    uploaded_file_file_name
end

def file_size
    uploaded_file_file_size
end
end
