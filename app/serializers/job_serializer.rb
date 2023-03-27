class JobSerializer < ActiveModel::Serializer
    attributes :id, :title, :recruiter, :location, :deadline, :details, :category, :user_id
    belongs_to :user
  
end
  