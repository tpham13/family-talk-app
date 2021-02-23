class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :group, :user

end
