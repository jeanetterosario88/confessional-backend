class SecretsController < ApplicationController
    
    def index
        secret = Secret.all
        render json: secret.to_json(:include => :secrets)
    end

    def show
        secret = Secret.find(params[:id])
        options = {
            include: [:secrets]
        }
        render json: SecretSerializer.new(secret, options)
    end

    def create
        secret = Secret.new(secret_params)
        if secret.save
            render json: SecretSerializer.new(secret)
        else
            render json: {errors: secret.errors.full_messages}
        end
    end
    
    
      private
      def secret_params
        params.require(:secret).permit(:title, :content)
      end


end
