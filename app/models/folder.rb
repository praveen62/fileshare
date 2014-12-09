class Folder < ActiveRecord::Base
  acts_as_tree
  belongs_to :user
  has_many :assets, :dependent => :destroy
  has_many :shared_folders, :dependent => :destroy
  attr_accessible :name, :parent_id, :user_id

  #a method to check if a folder has been shared or not
def shared?
    !self.shared_assets.empty?
end
end
