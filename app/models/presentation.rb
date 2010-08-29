class Presentation
  include DataMapper::Resource
  
  property :id,         Serial
  property :title,      String,        :required => true, :length => 500
  property :speaker,    String,        :required => true, :length => 500
  property :conference, String,        :required => true, :length => 500
  timestamps :at 

  def self.restore
    return ['already populated'] if Presentation.all(:limit => 1).size == 1
    result = []
    archive = YAML.load_file("vendor/data/presentations.yaml")
    archive.each do |entry|
      m = Presentation.new entry
      result << m.save
    end
    result
  end

end
