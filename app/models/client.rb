class Client < ActiveRecord::Base
  attr_accessible :credit_limit, :name
  has_many :operations, dependent: :destroy

  validates :credit_limit, presence: true
  validates :name, presence: true
end
