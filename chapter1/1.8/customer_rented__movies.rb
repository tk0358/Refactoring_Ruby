require_relative './lib/customer'
require_relative './lib/rental'
require_relative './lib/movie'

aflo = Movie.new('aflo', NewReleasePrice.new)
sazae = Movie.new('sazae', ChildrensPrice.new)
die_hard = Movie.new('die_hard', RegularPrice.new)

ruru = Customer.new('Ruru')
ruru.add_rental(Rental.new(aflo, 2))
ruru.add_rental(Rental.new(sazae, 8))
ruru.add_rental(Rental.new(die_hard, 8))

puts ruru.html_statement