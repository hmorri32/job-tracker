class Contact < ActiveRecord::Base
  validates  :name,  :position, presence: true
  validates  :email, uniqueness: true
  belongs_to :company
end