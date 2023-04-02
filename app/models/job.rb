class Job < ApplicationRecord
    belongs_to :user

    attribute :image, :string
end
