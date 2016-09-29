class MemorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cohort, :user_id, :date
end
