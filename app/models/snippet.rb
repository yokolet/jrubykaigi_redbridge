class Snippet
  include DataMapper::Resource
  
  property :id,   Serial
  property :name, String,        :required => true, :length => 500
  property :code, Text,          :required => true, :lazy => false
  timestamps :at 

  def self.restore
    return ['already populated'] if Snippet.all(:limit => 1).size == 1
    result = []
    archive = YAML.load_file("vendor/data/snippets.yaml")
    archive.each do |entry|
      m = Snippet.new entry
      result << m.save
    end
    result
  end

end
