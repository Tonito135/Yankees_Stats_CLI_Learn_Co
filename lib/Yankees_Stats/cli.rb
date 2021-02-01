class YankeesStats::CLI

    def intro
        YankeesStats::Stats.scrape_players
        initial
        team_leaders
        conclusion
        
    end

    
    def initial
        puts "Welcome to the 2020 MLB regular season stats!! Would you like to see who are the American League leaders in each department?"
       
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "yes"
                puts "Awesome! These are the title stats"
                league_title
                user
            when "no"
                conclusion
            else
                puts "Sorry, I don't understand what you mean, please say either, yes or no.."
            end
        end
    end

    def league_title
        Leader.all.each.with_index(1) do |title, i|
            puts "#{i}. #{title.title}"
        end
    end

    # binding.pry
    
    def user
        input = nil
        while input != "exit"
            puts "Would you like more info on someone? If so type their number, if not type no.."
            input = gets.strip.downcase
            if input.to_i > 0 && input.to_i <= Leader.all.length
                detailed_stats = Leader.all[input.to_i - 1]
                puts "#{detailed_stats.player_name} leads the league in #{detailed_stats.title.downcase} with #{detailed_stats.stat} being its #{detailed_stats.title.downcase}."
                puts "---------------------------"
                puts "Here are the league titles:"
                puts "---------------------------"
                league_title
                puts "---------------------------"
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
