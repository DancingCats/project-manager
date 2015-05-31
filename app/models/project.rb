class Project < ActiveRecord::Base
  has_many :tasks
  validates :title, presence: true,
            length: { minimum: 5 }
end
