class SearchCriteria
  
  attr_reader :author_id, :publisher_id, :isbn

  def initialize(author_id, publisher_id, isbn)
    @author_id = author_id
    @publisher_id = publisher_id
    @isbn = isbn
  end
end

criteria = SearchCriteria.new(5, 8, "0201485672")
p criteria