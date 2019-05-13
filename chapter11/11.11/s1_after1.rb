class LeftOuterJoin < Join

  def join_type
    "LEFT OUTER"
  end
end

class InnerJoin < Join

  def join_type
    "INNER"
  end
end

class Join
  #...

  def initialize(table, options)
    @table = table
    @on = options[:on]
  end

  def self.inherited(klass)
    klass.class_eval do
      def self.joins_for_table(table_name)
        table_name.to_s
      end
    end
  end

  def to_sql
    "#{join_type} JOIN #{@table} ON #{@on}"
  end
end

InnerJoin.new(
  :equipment_listings,
  :on => "equipment_listings.listing_id=listings.id"
).to_sql

InnerJoin.joins_for_table(:books)