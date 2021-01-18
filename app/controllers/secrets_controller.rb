class SecretsController < ApplicationController
    
    def index
        secrets = Secret.all
        # render json: SecretSerializer.new(secrets)
        render json: secrets.to_json(:include => :comments)
        
    end

    def show
        secret = Secret.find(params[:id])
        render json: secret.to_json(:include => :comments)
    end

    def create
        secret = Secret.new(secret_params)
        if secret.save
            render json: secret.to_json(:include => :comments)
        else
            render json: {errors: secret.errors.full_messages}
        end
    end
    
    
      private
      def secret_params
        params.require(:secret).permit(:title, :content)
      end


end
