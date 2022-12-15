class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        newFreebie = Freebie.create(dev_id: dev.id, item_name: item_name, value: value, company: self)
    end

    def Company.oldest_company
        Company.all.min_by{|c| c.founding_year }

    end


end
