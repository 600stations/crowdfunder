class Project < ApplicationRecord
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank

  has_many :pledges, dependent: :destroy
  has_many :users, through: :pledges
  belongs_to :user
  belongs_to :category

  validates  :title, :description, :deadline, presence: true
  validates :goal, numericality: {only_integer: true}

end
