class UserSerializer < ActiveModel::Serializers
    attributes :id, :name, :password_digest
  
    has_many :jobs
  end
  