class List < ActiveRecord::Base

  attr_accessible :name
  has_many :items, dependent: :destroy  

end
