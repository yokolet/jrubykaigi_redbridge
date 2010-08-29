class Page
  include DataMapper::Resource
  
  property :id,    Serial
  property :order, Integer,       :required => true
  property :title, String,        :required => true, :length => 500
  property :clue,  String,        :required => true, :length => 500
  property :body,  Text,          :required => true, :lazy => false
  timestamps :at 


  def self.restore
    return ['already populated'] if Page.all(:limit => 1).size == 1
    result = []
    archive = YAML.load_file("vendor/data/pages.yaml")
    archive.each do |entry|
      m = Page.new entry
      result << m.save
    end
    result
  end

end
