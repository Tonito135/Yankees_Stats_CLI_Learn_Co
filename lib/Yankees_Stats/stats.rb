class YankeesStats::Stats
attr_accessor :title, :player_name, :stat

    def self.scrape_players
        doc = Nokogiri::HTML(open("https://www.thescore.com/mlb/leaders"))
        
        #document.querySelectorAll(".LeadersCard__title--VxUYA")[0].textContent
        #document.querySelectorAll(".LeadersCard__card--3lVyQ")[0]
        #leaders[0].css(".LeadersCard__title--VxUYA")[2]

        leaders = doc.css(".LeadersGrid__cardContainer--35Wst")
        
        leaders.each do |leaders_group|
            leaders_group.css(".LeadersCard__card--3lVyQ").each do |card|
                stat_title = card.children[0].children[0].text
                player_name = card.css(".LeadersCard__leader--2ViSJ").children[0].children[0].children[0].children[0].children[0].children[0].children[0].children[0].attributes["alt"].value
                player_stat = card.css(".LeadersCard__stat--158EL").children[0]
                leader = Leader.new
                leader.player_name = player_name
                leader.title = stat_title
                leader.stat = player_stat
                leader
            end
        end
    end
end



#team_leader_1 = self.new
#team_leader_1.name = "Gleyber Torres"
#team_leader_1.position = "SS"
#team_leader_1.avg = ".435 avg"
#team_leader_1.hr = "2 HR"
#team_leader_1.rbi = "5 RBI"
#
#team_leader_2 = self.new
#team_leader_2.name = "Giancarlo Stanton"
#team_leader_2.position = "DH"
#team_leader_2.avg = ".308 avg"
#team_leader_2.hr = "6 HR"
#team_leader_2.rbi = "13 RBI"
#
#team_leader_3 = self.new
#team_leader_3.name = "Gerrit Cole"
#team_leader_3.position = "SP"
#team_leader_3.era = "2.95 ERA"
#team_leader_3.gp = "3 GP"
#team_leader_3.winloss = "2/0 W/L"
#
#team_leader_4 = self.new
#team_leader_4.name = "Zach Britton"
#team_leader_4.position = "RP"
#team_leader_4.era = "3.38 ERA"
#team_leader_4.gp = "4 GP"
#team_leader_4.winloss = "0/0 W/L"
#
#team_leader_5 = self.new
#team_leader_5.name = "Aroldis Chapman"
#team_leader_5.position = "RP"
#team_leader_5.era = "1.93 ERA"
#team_leader_5.gp = "3 GP"
#team_leader_5.winloss = "1/1 W/L"
#
#[team_leader_1, team_leader_2, team_leader_3, team_leader_4, team_leader_5]


    #def self.player
#
    #end
#
    #def self.player
    #    self.scrape_voit_detailed_stats.
#
    #end
