module Types
  class MutationType < Types::BaseObject
    field :createPost, mutation: Mutations::CreatePost
  end
end
