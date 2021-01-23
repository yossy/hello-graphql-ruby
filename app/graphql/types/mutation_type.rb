module Types
  class MutationType < Types::BaseObject
    # NOTE: 叩くqueryのfieldの名前になる。JSに合わせてlowerCamelにしておく。
    field :createComment, mutation: Mutations::CreateComment
    field :deletePost, mutation: Mutations::DeletePost
    field :updatePost, mutation: Mutations::UpdatePost
    field :createPost, mutation: Mutations::CreatePost
  end
end
