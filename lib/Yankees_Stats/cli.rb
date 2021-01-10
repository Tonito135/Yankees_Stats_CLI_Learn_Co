class YankeesStats::CLI

    def intro
        initial
        team_leaders
        conclusion
    end

    
    def initial
        puts "Welcome to the New York Yankees 2020 Regular Season stats!! Would you like to see info on the Home Run and Average leaders?"

        @stats = YankeesStats::Stats.current
        
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "yes"
                puts "Awesome! These are the leaders"
                team_stats
                user
            when "no"
                conclusion
            else
                puts "Sorry, I don't understand what you mean, please say either, yes or no.."
            end
        end
    end

    def team_stats
        @stats.each.with_index(1) do |player, i|
            puts "#{i}. #{player.name}"
        end
    end

    def user
        input = nil
        while input != "exit"
            puts "Would you like more info on someone? If so type their number, if not type no.."
            input = gets.strip.downcase
            if input.to_i > 0 && input.to_i <= @stats.length
                detailed_stats = @stats[input.to_i - 1]
                puts "#{detailed_stats.name} is a #{detailed_stats.position} with a #{detailed_stats.avg} average. He has hit #{detailed_stats.hr} with #{detailed_stats.rbi}. He has a #{detailed_stats.obp} OBP."
            elsif input == "no"
                conclusion
            else
                error_statement
            end
        end
    end

    def error_statement
        puts "I'm sorry I dont quite understand,"
    end

    def conclusion
        puts "Thank you for stopping bye! Have a good one!"
        exit
    end
end
