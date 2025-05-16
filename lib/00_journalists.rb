require_relative ("./data_journalists.rb")



# Methode qui renvoie le nombre d'éléments que contient le tableau
def array_length(array)

  puts "Il y a #{array.length} handle dans cette array"
end



# Methode qui renvoie la donnée la plus courte du tableau
def shortest_handle(array)
  
  short_handle = array[0]
  
  array.each do |handle|
    
    if handle.length < short_handle.length
      short_handle = handle
    end

  end
    
    puts "#{short_handle} est la handle la plus courte"
end
      

# Methode qui renvoie combien d'éléments du tableau contient 5 caractères
def five_characters_counter(array)
  five_letters_array =[]
  counter = 0
  array.each do |handle|
    
    # temp = handle.scan(/[a-zA-Z]/).join
    temp = handle.delete("@")
    
    if temp.length == 5

      # five_letters_array.push(handle)
      counter += 1

    end

  end
  # puts "\n HANDLES A 5 CARACTERES"
  # puts five_letters_array
  puts "Il y a #{counter} handle contenant 5 caractères"
end



# Methode qui renvoie combien d'éléments du tableau commencent par une majuscule
def uppcase_counter(array)
  uppcase_array = []
  handle_characters = []
  counter = 0
  array.each do |handle|

    temp = handle.delete("@")
    handle_characters = temp.chars

    if handle_characters[0].scan(/[A-Z]/)

      uppcase_array.push(handle)
      counter += 1

    end
  end
  # puts uppcase_array
  return uppcase_array
end

# Methode qui trie les éléments du tableau par ordre alphabétique
def sort_array(array)

  sorted_array = array.sort_by(&:downcase)

  # Trie les handle par ordres alphabétique en ne prenant pas en compte les caractères autre que alphabétique

  # sorted_array = array.sort_by do |handle| 
  #   handle.gsub(/^[^a-zA-Z]+/, '').downcase
  # end

  puts "\n TRIE PAR ORDRE ALPHABETIQUE"
  puts sorted_array
  return sorted_array

end

# Methode qui trie les éléments du tableau par leurs taille
def sort_handle_length(array)

  sorted_array = array.sort_by(&:length)

  puts "\n TRIE PAR TAILLE DES HANDLES "
  puts sorted_array
  return sorted_array
end

# Methode qui trouve la position de @epenser dans le tableau 
def find_position_handle(array)
position = 0

  array.each do |handle|

    if handle == "@epenser"

      puts "Tu penses à @epenser ? Il est en #{position}ème position"

    else
      position += 1
    end

  end
end

# Methode qui répartie les handles par taille
def handle_length_repartition(array)
  parts = {}

  array.each do |handle|
    temp = handle.delete("@")
    length = temp.length

    parts[length] ||= [] # Opérateur d'affectation conditionelle si ça retourne nil ou false alors il initialise la variable
    parts[length] << handle
    # parts[length].push(handle)
  end

    # Récupère un tableau des clés du hash (keys) les trient et ensuite exécute le code pour chacune
    parts.keys.sort.each do |length| 
      puts "\nHandle de #{length} de longueur\n\n"
      puts parts[length]
    end

  
end


#  Methode qui permet de naviguer entre les différents choix et faire appelle aux méthodes concernés ?
def crazy_array(array)
  

choice = ""

  puts "Bienvenue dans Crazy Array! journalist edition!!!"
  puts "Plusieurs opérations sont à ta disposition! Fais ton choix !"

  while choice != "quit" && choice != "q"

      
      puts "Saisie ton choix ou sa première lettre pour continuer :)"
      puts "Infos | Trier | Groupes | Quit"
      print "> "
      choice = gets.chomp.downcase
      
      case choice
      when "infos" , "i"

        while choice != "retour" && choice != "r"

          puts "Quelles infos souhaite-tu ?"
          puts "Stats | Penser | Retour"
          print "> "
          choice = gets.chomp.downcase

          case choice
          when "stats", "s"
            array_length(array)
            shortest_handle(array)
            five_characters_counter(array)
            uppcase_counter(array)

          when "penser" , "p"
            find_position_handle(array)

          when "retour" , "r"
          
          else
            invalid_choice
          end
        end

      when "trier" , "trie" , "t"
        
        while choice != "retour" && choice != "r"
          puts "De quelle manière veux tu voir le tableau trié ? ( ͡⎚ ω ͡⎚) "
          puts "Alphabétiquement | Longueur | Retour"
          choice = gets.chomp.downcase

          case choice
          when "alphabétiquement", "alphabetiquement", "alphabet", "a"

            sort_array(array)

            if choice == "alphabétiquement" || choice == "alphabetiquement"
              puts "Tu l'as écris en entier ? Respect! ദ്ദി(˵ •̀ ᴗ - ˵ ) ✧ Mais n'oublie pas que tu peux utiliser la première lettre :D"
            end

          when "longueur", "long", "l"
        
          sort_handle_length(array)

          when "retour", "r"
           
          else
            invalid_choice
          end
        end  
        
      when "groupes" , "g"

        handle_length_repartition(array)

      when "quit" , "q"

        puts "Bye bye au plaisir de te revoir sur Crazy Array! journalist edition ;)"

      else
        invalid_choice
      end


  end
end

def invalid_choice

  puts "Saisie invalide! Saisie ton choix ou sa première lettre pour continuer"
  
end


# Methode qui exécute la méthode menu :s
def perform()


  crazy_array(data_journalists)

end



perform()


# array_length(journalists)
# shortest_handle(journalists)
# five_characters_handle(journalists)
# uppcase_handle(journalists)
# # sort_array(journalists)
# # sort_handle_length(journalists)
# find_position_handle(journalists)
# # handle_length_repartition(journalists)
