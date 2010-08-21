class Snippet
  include DataMapper::Resource
  
  property :id,   Serial
  property :name, String,        :required => true, :length => 500
  property :code, Text,          :required => true, :lazy => false
  timestamps :at 
end
