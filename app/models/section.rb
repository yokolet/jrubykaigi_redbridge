class Section
  include DataMapper::Resource
  
  property :id,    Serial
  property :order, Integer,       :required => true
  property :title, String,        :required => true, :length => 500
  property :clue,  String,        :required => true, :length => 500
  timestamps :at 


  def self.restore
    return ['already populated'] if Section.all(:limit => 1).size == 1
    result = []
    archive = YAML.load_file("vendor/data/sections.yaml")
    archive.each do |entry|
      m = Section.new entry
      result << m.save
    end
    result
  end

end
