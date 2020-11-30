class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :content, :user_id
end
