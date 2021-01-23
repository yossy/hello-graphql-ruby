module Mutations
  class CreateComment < BaseMutation
    field :comment, Types::CommentType, null: true
    field :errors, [String], null: false

    argument :post_id, ID, required: true
    argument :content, String, required: true

    def resolve(post_id:, content:)
      post = Post.find(post_id)
      comment = post.comments.build(content: content)
      if comment.save
        {
          comment: comment,
          errors: []
        }
      else
        {
          comment: nil,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end
