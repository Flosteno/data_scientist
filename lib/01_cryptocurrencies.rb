require_relative("./data_cryptocurrencies.rb")
cryptos = data_cryptos

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
    puts "#{name} #{price}"
  end
end


def highest_under_six_thousand(data)

  under = data.select {|name,price| price < 6000}
  highest_under = under.select {|name,price| price == under.values.max}

  puts "----DEVISE LA PLUS CHERE PARMI INFERIEUR A 6000----"
  puts "Voici les devise les plus chèrent parmi celles dont le cours est en dessous de 6000 "
  highest_under.each do |name,price|
    puts "#{name} #{price} "
  end

end


def invalid_choice

  puts "Saisie Invalide ! Réessaye"

end


def saisie

  print "> "
  choice = gets.chomp.downcase
  return choice

end


def crypto_stats(data)

  puts "Hello ! :}"
  choice = ""

  while choice != "quit" && choice != "q"

    puts "Saisie ton choix "
    puts " Values | Six | Quit"
     choice = saisie

    case choice
    when "values" , "v"

      while choice != "retour" && choice != "r"

        puts "Affiche les crypto ayant les valeurs les plus élevés et les plus basses "
        puts " Highest | Lowest | Retour"
        choice = saisie

        case choice
        when "highest" , "h"
          highest_value(data)
        when "lowest" , "l"
          lowest_value(data)
        when "retour" , "r"

        else
          invalid_choice
        end

      end

    when "six" , "s"

      while choice != "retour" && choice != "r"

        puts "Affiche respectivement toute les devises d'une valeur en dessous de 6000 et la devise la plus haute parmi celle-ci"
        puts " All | Highest | Retour"
        choice = saisie
        
        case choice
        when "all" , "a"
          under_six_thousand(data)
        when "highest" , "h"
          highest_under_six_thousand(data)
        when "retour" , "r"

        else
          invalid_choice
        end
      end

    when "quit" , "q"
      puts "Fin du programme *insérer son fermeture windows*"
    else
      invalid_choice
    end
  end
end

    



def perform(data)

  crypto_stats(data)

end
  


perform(cryptos)


# highest_value(cryptos)
# lowest_value(cryptos)
# # under_six_thousand(cryptos)
# highest_under_six_thousand(cryptos)