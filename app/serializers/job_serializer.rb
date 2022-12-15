class JobSerializer < ActiveModel::Serializer
    attributes :id, :title, :recruiter, :location, :ifremote, :stack, :user_id

    belongs_to :user
  
end
  