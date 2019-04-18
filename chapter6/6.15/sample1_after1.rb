class Books
  
  def self.find(selector, hash={})
    hash[:joins] ||= []
    hash[:conditions] ||= ""

    sql = ["SELECT * FROM books"]
    hash[:joins].each do |join_table|
      sql << "LEFT OUTER JOIN #{join_table}"
      sql << "ON books.#{join_table.to_s.chop}_id = #{join_table}.id"
    end

    sql << "WHERE #{hash[:conditions]}" unless hash[:conditions].empty?
    sql << "LIMIT 1" if selector == :first

    connection.find(sql.join(" "))
  end
end


Books.find(:all)
Books.find(:all,
           :conditions => "authors.name = 'Jenny   James'",
           :joins => [:authors])
Books.find(:first,
           :conditions => "authors.name = 'JennyJames'",
           :joins => [:authors])