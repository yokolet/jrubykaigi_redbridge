class Section
  include DataMapper::Resource
  
  property :id,    Serial
  property :order, Integer,       :required => true
  property :title, String,        :required => true, :length => 500
  property :clue,  String,        :required => true, :length => 500
  timestamps :at 
end
