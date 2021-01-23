module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true

    # resolveの返り値のkeyになる。
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(title:, description:)
      post = Post.new(title: title, description: description)
      if post.save
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
