class JobSerializer < ActiveModel::Serializer
    attributes :id, :title, :location, :image, :recruiter, :details, :deadline, :category, :user_id
    belongs_to :user
  
end
  