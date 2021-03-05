class GroupSerializer
  include FastJsonapi::ObjectSerializer
  attributes :group_name
  has_many :posts through: :users, serializer: PostSerializer
  has_many :users, serializer: UserSerializer
end
