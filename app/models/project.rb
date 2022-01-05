class Project < ApplicationRecord
  belongs_to :user

  # has_many :users, through: :project_users, as: :clients
  has_many :deliverables, dependent: :destroy
  has_many :drafts, through: :deliverables
  has_many :users, through: :project_users

  # scope :filter_status, ->status { where("status ILIKE ?", status) }
  scope :filter_name, ->name { where("name ILIKE ?", "%#{name}%")}
  scope :status, ->status { where("status ILIKE ?", "%#{status}%")}

  def brand
    Organisation.find(self.client_id)
  end
end
