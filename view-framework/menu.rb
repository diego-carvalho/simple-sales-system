# Dir["Actions/*.rb"].each {|file| require_relative file }
require_relative 'Actions/exitOption'


class Menu
    attr_accessor :title, :msgChoice, :msgChoiceNotExist, :msgChoiceInvalide
	
    def initialize(title = "MENU")
        @msgChoice = "Escolha umas das opções acima"
        @msgChoiceNotExist = "Opção escolhida incorreta, somente numeros validos."
        @msgChoiceInvalide = "Opção escolhida incorreta, use apenas numeros."
        @exitOption = ExitOption.new
        @actions = Array.new

        @actions << @exitOption
		@title = title;
    end

    def getTitle
        return @title
    end

    def addAction(action)
        @actions << action
    end

    def runAction
        choice = true;
        while choice do
            cont = 0
            puts "\n"
			puts "-------------------------------------------"
            puts title
            @actions.each do |action|
                puts "#{cont} - #{action.getTitle}"
                cont = cont.next
            end
            begin
                choice = Integer(gets.chomp)
                if !(choice >= 0 && choice < @actions.size)
                    puts msgChoiceNotExist
                    choice = true
                else
                    if !@actions[choice].is_a? Menu
                        puts @actions[choice].getTitle
                    end
                    choice = @actions[choice].runAction
                end
            rescue Exception => e
                puts msgChoiceInvalide
                choice = true
                return true
            end
        end
        return true
    end

    def to_s
        return "Menu to_s"
    end
end