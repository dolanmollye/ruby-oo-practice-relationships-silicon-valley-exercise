require 'pry'

class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []
 
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find{|first_startup| first_startup.founder == founder_name}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

end
