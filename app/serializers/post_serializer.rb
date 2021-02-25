class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :user, :group

end
