class CommentSerializer
    include FastJsonapi::ObjectSerializer
    attributes :content, :secret
    belongs_to :secret
  end
  