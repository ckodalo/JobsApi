class JobSerializer < ActiveModel::Serializer
    attributes :id, :title, :recruiter, :location, :deadline, :details, :user_id

    belongs_to :user
  
end
  