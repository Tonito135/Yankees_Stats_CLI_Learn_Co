class YankeesStats::Stats
attr_accessor :name, :position, :avg, :hr, :rbi, :obp

    def self.current
        self.scrape_stats
    
    end
    
    def self.scrape_stats
        stats = []
        stats << self.scrape_dj_detailed_stats
        stats << self.scrape_voit_detailed_stats
        stats           
    end

    def self.scrape_dj_detailed_stats
        doc = Nokogiri::HTML(open("https://www.thescore.com/mlb/players/2093/stats"))
        
        player = self.new

        player.name = doc.search("div.PlayerBanner__playerName--YNtth").text
        player.position = "2nd Baseman"
        player.avg = ".364 Average"
        player.hr = "10 Homeruns"
        player.rbi = "27 RBI"
        player.obp = "0.421 OBP"

        player
    end

    def self.scrape_voit_detailed_stats
        doc = Nokogiri::HTML(open("https://www.thescore.com/mlb/players/5630/stats"))
        
        player = self.new

        player.name = doc.search("div.PlayerBanner__playerName--YNtth").text
        player.position = "1st Baseman"
        player.avg = ".277 Average"
        player.hr = "22 Homeruns"
        player.rbi = "52 RBI"
        player.obp = "0.338 OBP"
        
        player
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
