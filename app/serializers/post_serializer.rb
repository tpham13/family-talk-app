class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content

  belongs_to :group
  belongs_to :user
end
