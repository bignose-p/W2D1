# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts "This can't be turned into a number...!"
  ensure
    num ||= nil
  end
  
  num
end
# PHASE 3

class EmptyError < StandardError
  def message
    puts "Well, give me somethin ya wench!"
  end
end

class CoffeeError < StandardError
  def message
    puts "U can try again, I do like coffee but I already had my 10 cups this morning!"
  end
end

class BadFoodError < StandardError 
  def message
    puts "I can't eat that! Be gone!"
  end 
end 

class NotFriendError < StandardError
  def message
    puts "We can't be best friends -- sry "
  end
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError
  elsif maybe_fruit == ''
    raise EmptyError
  else
    raise BadFoodError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin 
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => error
    error.message
    retry
  rescue EmptyError => error 
    error.message 
    retry
  rescue BadFoodError => error 
    error.message 
  end
end  



# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5 || name == '' || fav_pastime == ''
      raise NotFriendError
    else
      @yrs_known = yrs_known
      @name = name
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


