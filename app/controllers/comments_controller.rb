class CommentsController < ApplicationController

    def index
      comments = Comment.all
      render json: CommentSerializer.new(comments)
    end
     
    def show
        comment = Comment.find_by(id: params[:id])
        options = {
          include: [:title, :content]
       }
        render json: CommentSerializer.new(comment)
    end

    def create
      comment = Comment.new(comment_params)
      comment.likes = 0
      if comment.save
        render json: CommentSerializer.new(comment)
      else
        render json: {errors: comment.errors.full_messages}
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :secret_id)
    end

end
