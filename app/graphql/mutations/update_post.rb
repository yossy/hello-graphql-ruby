module Mutations
  class UpdatePost < BaseMutation
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    def resolve(id:, title:, description:)
      post = Post.find(id)
      if post.update(title: title, description: description)
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
