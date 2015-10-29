class Goal < ActiveRecord::Base
  validates :description, :presence => true
  belongs_to :category
end
