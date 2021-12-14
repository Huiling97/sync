class Deliverable < ApplicationRecord
  belongs_to :project
  has_many :drafts, dependent: :destroy
  has_many :comments, through: :drafts

  acts_as_taggable_on :tags
  acts_as_taggable_on :type, :details
end
