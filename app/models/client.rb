class Client < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, presence: true, length: { maximum: 50 }
end
