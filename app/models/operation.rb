class Operation < ActiveRecord::Base
  belongs_to :client
  attr_accessible :coment, :value

  validates :client_id, presence: true
  validates :value, presence: true, numericality: { only_integer: true }
  default_scope order: 'operations.created_at DESC'
end
