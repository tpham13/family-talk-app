class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :user

  has_many :comments, serializer: CommentSerializer
 
end
