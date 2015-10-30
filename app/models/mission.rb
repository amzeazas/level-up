class Mission < ActiveRecord::Base
  validates :description, :presence => true
  belongs_to :quest
end
