class SecretSerializer
    include FastJsonapi::ObjectSerializer
    has_many :comments
    attributes :title, :content, :likes
  
    
  end
  