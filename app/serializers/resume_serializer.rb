class ResumeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :subject, :description, :title, :experience, :skills_set, :public_url, :updated_at
end
