class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username
   has_many :posts, serializer: PostSerializer
  #  belongs_to :group, serializer: GroupSerializer
  attributes :group do |user|
    { 
      group_name: user.group.group_name
     }
  end
  

end
