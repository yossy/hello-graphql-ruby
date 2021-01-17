module Mutations
  class CreatePost < BaseMutation
    graphql_name 'CreatePost'

    argument :title, String, required: true
    argument :description, String, required: true

    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    def resolve(title:, description:)
      post = Post.create(title: title, description: description)
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end
