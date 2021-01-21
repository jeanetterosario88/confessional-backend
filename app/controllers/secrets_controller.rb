class SecretsController < ApplicationController
    
    def index
        secrets = Secret.all
        render json: secrets.to_json(:include => :comments)
        
    end

    def show
        secret = Secret.find(params[:id])
        render json: secret.to_json(:include => :comments)
    end

    def create
        secret = Secret.new(secret_params)
        secret.likes = 0
        if secret.save
            render json: secret.to_json(:include => :comments)
        else
            render json: {errors: secret.errors.full_messages}
        end
    end

    def update
        secret = Secret.find(params[:id])
        upvoted_likes = secret.likes + 1
        secret.update(likes: upvoted_likes)
        render json: secret.to_json(:include => :comments)
      end
    
    
      private
      def secret_params
        params.require(:secret).permit(:title, :content)
      end


end
