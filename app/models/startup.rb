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

    def num_funding_rounds
        FundingRound.all.select{|round| round.startup == self}
    end

    def total_funds
        total_sum = 0
        FundingRound.all.each do |funding|
            total_sum += funding.investment
        end
        total_sum
    end

    def investors
        num_funding_rounds.map{|vent_cap| vent_cap.vc.name}.uniq
    end

    def big_investors
        FundingRound.all.select{|round| round.startup == self}.map{|vent_cap| vent_cap.vc}.reject{|not_club| not_club.total_worth < 1000000000}.uniq.map{|big_vc| big_vc.name}
    
        #investors.select{|investor| investor.tres_commas_club}
    end

    # def self.tres_commas_club
    #     self.all.select{|cap| cap.total_worth >= 1000000000}
    # end


end
