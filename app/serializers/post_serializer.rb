class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :user

end
