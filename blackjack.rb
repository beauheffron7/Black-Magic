require "pry"
class Game
  def initialize
      @deck = {"2H"=>2,"3H"=>3,"4H"=>4,"5H"=>5,"6H"=>6,"7H"=>7,"8H"=>8,"9H"=>9,"10H"=>10,"jH"=>10,"qH"=>10,"kH"=>10,"aH"=> 1,

              "2S"=>2,"3S"=>3,"4S"=>4,"5S"=>5,"6S"=>6,"7S"=>7,"8S"=>8,"9S"=>9,"10S"=>10,"jS"=>10,"qS"=>10,"kS"=>10,"aS"=> 1,

              "2C"=>2,"3C"=>3,"4C"=>4,"5C"=>5,"6C"=>6,"7C"=>7,"8C"=>8,"9C"=>9,"10C"=>10,"jC"=>10,"qC"=>10,"kC"=>10,"aC"=> 1,

              "2D"=>2,"3D"=>3,"4D"=>4,"5D"=>5,"6D"=>6,"7D"=>7,"8D"=>8,"9D"=>9,"10D"=>10,"jD"=>10,"qD"=>10,"kD"=>10,"aD"=> 1}
    
      
    
      @keys = @deck.keys
      @running_count = 0
  end
  
  def compare
    if @cpucount == @running_count
      puts "It's a draw! The house takes the cash."
      elsif @cpucount < @running_count
      puts "You won! Great job."
    else
      puts "You lost. Better luck next time."
    end
  end
  
  def cpumove
    @cpucards = [@keys[2],@keys[3]]
    @cpucount = @deck[@keys[2]] + @deck[@keys[3]]
    puts "Cpu cards: " + @cpucards.join(" ")
    while true
      if @cpucount < 22
          if @cpucount<17
            @cpucards << @keys[@counter]
            @cpucount = @cpucount + @deck[@keys[@counter]]
            puts "Cpu hits and gets a " + @keys[@counter]
            puts "Cpu counter: " + @cpucount.to_s
          else  
            puts "Cpu stands"
            puts "Cpu counter: " + @cpucount.to_s
            compare
            break
          end
      else
        puts "Computer busted"
        puts "You win!"
        break
      end
    end
  end
  
  def startgame
    @keys = @keys.shuffle
    @currentcards = [@keys[0], @keys[1]]
    puts "The CPU's cards: " + @keys[2] + " " + @keys[3]
    puts "Starting cards: " + @currentcards.join(" ")
    @running_count = @deck[@keys[0]] + @deck[@keys[1]]
    puts "Your total value is: #{@running_count}"
    @counter = 4
    while true
        puts "Would you like to hit or stand? H/S"
        @response = gets.chomp
        if @response == "h" or @response == "H"
          puts "You now have: " + @currentcards.join(" ") +  " " + @keys[@counter]
          @currentcards << @keys[@counter]
          @running_count = @deck[@keys[@counter]] + @running_count
          @counter += 1
         puts "Your total value is: #{@running_count}"
            if @running_count > 21
              puts "You have busted"
              puts "The computer wins"
              break
            end
          else
          puts "You chose to stand on " + @running_count.to_s
          cpumove
          break
        end
    end
  end
end

game = Game.new
game.startgame