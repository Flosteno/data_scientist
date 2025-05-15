require_relative("./data_cryptocurrencies.rb")
blockchains = data_blockchains

def highest_value(data)

  highest = data.select {|name, price| price == data.values.max}

  puts "----CRYPTO AVEC LA PLUS GROSSE VALEUR----"

  highest.each do |name,price|
    puts "#{name} avec une valeur de #{price} est la plus élevée"

  end
end

def lowest_value(data)

  lowest = data.select {|name,price| price == data.values.min}

  puts "----CRYPTO AVEC LES PLUS PETITES VALEURS----"

  lowest.each do |name,price|
    puts "#{name} avec une valeur de #{price} est la moins élevée"
  end

end


def under_six_thousand(data)

  under = data.select {|name,price| price < 6000}


  puts "----DEVISES DONT LE COURS EST INFERIEUR A 6000----"
  puts "Voici les blockchains dont les valeurs sont en dessous de 6000 :"

  under.each do |name,price|
    puts "#{name} +" "+ #{price}"
  end
end


def highest_under_six_thousand(data)

  under = data.select {|name,price| price < 6000}
  highest_under = under.select {|name,price| price == under.values.max}

  puts "----DEVISE LA PLUS CHERE PARMI INFERIEUR A 6000----"
  puts "Voici les devise les plus chèrent parmi celles dont le cours est en dessous de 6000 "
  highest_under.each do |name,price|
    puts "#{name} +" "+ #{price} "
  end

end

def perform(data)

  highest_value(data)
  lowest_value(data)
  under_six_thousand(data)
  highest_under_six_thousand(data)

end

perform(blockchains)


# highest_value(blockchains)
# lowest_value(blockchains)
# # under_six_thousand(blockchains)
# highest_under_six_thousand(blockchains)