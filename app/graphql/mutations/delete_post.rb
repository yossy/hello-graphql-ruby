module Mutations
  class DeletePost < BaseMutation
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true

    def resolve(id:)
      post = Post.find(id)
      if post.destroy
        {
          post: post,
          errors: []
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
