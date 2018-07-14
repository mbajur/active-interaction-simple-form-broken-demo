class Comments::Create < ActiveInteraction::Base
  string :body, default: nil

  validates :body, presence: true

  def to_model
    Comment.new
  end

  def execute
    comment = Comment.new
    comment.body = body

    unless comment.save
      errors.merge!(comment.errors)
    end

    comment
  end
end
