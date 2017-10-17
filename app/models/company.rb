class Company < ApplicationRecord
  validates :name,     presence:    true
  validates :name,     uniqueness:  true
  has_many  :jobs,     dependent:  :destroy
  has_many  :contacts, dependent:  :destroy
end
