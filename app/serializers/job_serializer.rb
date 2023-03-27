class JobSerializer < ActiveModel::Serializers
    attributes :id, :title, :recruiter, :location, :deadline, :details, :category, :user_id
    belongs_to :user
  
end
  