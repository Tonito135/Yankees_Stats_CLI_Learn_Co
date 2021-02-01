class Leader

    attr_accessor :title, :player_name, :stat

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

end


