class Presentation
  include DataMapper::Resource
  
  property :id,         Serial
  property :title,      String,        :required => true, :length => 500
  property :speaker,    String,        :required => true, :length => 500
  property :conference, String,        :required => true, :length => 500
  timestamps :at 
end
