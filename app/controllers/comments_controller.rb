class CommentsController < ApplicationController

    def index
      comments = Comment.all
      render json: comments.to_json
    end
     
    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment.to_json
    end

    def create
      comment = Comment.new(comment_params)
      if comment.save
        render json: comment.to_json
      else
        render json: {errors: comment.errors.full_messages}
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :secret_id)
    end

end
