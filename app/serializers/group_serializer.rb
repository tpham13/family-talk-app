class GroupSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :posts, serializer: PostSerializer
  has_many :users, serializer: UserSerializer
end
