class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :updated_at, :user

end
